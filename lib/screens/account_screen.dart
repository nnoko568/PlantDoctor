import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../helpers/app_color.dart';
import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const List<String> settingTitle = [
    'Profile',
    'History',
    'Terms & Services',
    'Help',
  ];

  final List<Icon> settingIcon = const [
    Icon(
      Icons.account_circle,
      size: 30,
      color: AppColor.mainColor,
    ),
    Icon(
      Icons.history_toggle_off_outlined,
      size: 30,
      color: AppColor.mainColor,
    ),
    Icon(
      Icons.library_books_rounded,
      size: 30,
      color: AppColor.mainColor,
    ),
    Icon(
      Icons.help_outline_outlined,
      size: 30,
      color: AppColor.mainColor,
    ),
  ];

  void selectSetting(String setting, context) {
    if (setting == 'Profile') {
      FirebaseAuth.instance.idTokenChanges().listen((User? user) {
        if (user == null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ProfileScreen();
              },
            ),
          );
        }
      });
    } else {
      Fluttertoast.showToast(msg: 'Still under development');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Account',
          style: TextStyle(color: AppColor.mainColor),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: settingTitle.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () => selectSetting(settingTitle[index], context),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          settingIcon[index],
                          const SizedBox(width: 20),
                          Text(
                            settingTitle[index],
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
