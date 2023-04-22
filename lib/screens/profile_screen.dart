import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../helpers/app_color.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _auth = FirebaseAuth.instance;

  static const List<String> userInfo = [
    'Ajong',
    'Trevor',
    'trevor.ajong@gmail.com',
    '*********'
  ];

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

  void logout() {
    _auth.signOut();
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
              itemCount: userInfo.length,
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
                                userInfo[index],
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
            onPressed: logout,
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
