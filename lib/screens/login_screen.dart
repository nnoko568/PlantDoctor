import 'package:flutter/material.dart';

import '../helpers/app_color.dart';
import '../widgets/custom_text_field.dart';
import '../screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey _key = GlobalKey<FormState>();

  TextEditingController phoneNumberEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.mainColor),
        title: const Text(
          'Login',
          style: TextStyle(color: AppColor.mainColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/plant-doctor.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    CustomTextField(
                      editingController: phoneNumberEditingController,
                      placeHolder: 'Phone Number',
                      isObscure: false,
                      textInputType: TextInputType.number,
                    ),
                    CustomTextField(
                      editingController: passwordEditingController,
                      placeHolder: 'Password',
                      isObscure: true,
                      textInputType: TextInputType.text,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 85.0,
                          ),
                          backgroundColor: AppColor.mainColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'No account yet?',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignupScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 20.0, color: AppColor.mainColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
