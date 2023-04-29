import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../helpers/app_color.dart';
import '../widgets/home.dart';
import '../models/users.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  static final List<String> userInfo = [
    'John',
    'Doe',
    'johndeo@gmail.com',
    '*********'
  ];

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;

  User? users = FirebaseAuth.instance.currentUser;
  Users loggedInUser = Users();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('users').doc(users!.uid).get().then(
      (value) {
        loggedInUser = Users.fromMap(value.data());
      },
    );
  }

  final List<Icon> userInforIcon = const [
    Icon(
      Icons.account_circle,
      size: 30,
      color: AppColor.mainColor,
    ),
    Icon(
      Icons.account_circle,
      size: 30,
      color: AppColor.mainColor,
    ),
    Icon(
      Icons.email,
      size: 30,
      color: AppColor.mainColor,
    ),
    Icon(
      Icons.phone,
      size: 30,
      color: AppColor.mainColor,
    ),
  ];

  void logout(BuildContext context) {
    _auth.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      ),
    );
    Fluttertoast.showToast(msg: 'logout successful!');
  }

  @override
  Widget build(BuildContext context) {
    void showToastMessage() {
      Fluttertoast.showToast(msg: 'Still under development');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: AppColor.mainColor),
        ),
        iconTheme: const IconThemeData(color: AppColor.mainColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 80.0,
            backgroundColor: AppColor.lightGray,
            child: Icon(
              Icons.image,
              size: 50.0,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: showToastMessage,
            icon: Icon(Icons.camera_alt),
            color: AppColor.mainColor,
          ),
          Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
              itemCount: ProfileScreen.userInfo.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              userInforIcon[index],
                              const SizedBox(width: 20),
                              Text(
                                ProfileScreen.userInfo[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: index == 3
                                      ? AppColor.lightGray
                                      : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: showToastMessage,
                            icon: Icon(Icons.edit),
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          TextButton.icon(
            onPressed: () => logout(context),
            icon: Icon(
              Icons.logout,
              color: AppColor.mainColor,
            ),
            label: Text(
              'Logout',
              style: TextStyle(color: AppColor.mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
