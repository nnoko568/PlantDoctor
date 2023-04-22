import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/onboarding_screen.dart';
import 'widgets/home.dart';
import 'helpers/app_color.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt('initScreen');
  await prefs.setInt('initScreen', 1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Doctor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.mainColor,
        primarySwatch: Colors.green,
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'first' : '/',
      routes: {
        '/': (context) => const Home(),
        'first': (context) => const OnboardingScreen(),
      },
    );
  }
}
