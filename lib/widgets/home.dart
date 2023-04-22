import 'package:flutter/material.dart';

import '../screens/camera_screen.dart';
import '../screens/form_screen.dart';
import '../screens/account_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    const FormScreen(),
    const CameraScreen(),
    const AccountScreen(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Form',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Account',
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }
}
