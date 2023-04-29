import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helpers/app_color.dart';
import '../widgets/custom_text_field.dart';
import '../screens/signup_screen.dart';
import '../widgets/home.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _auth = FirebaseAuth.instance;

  TextEditingController emailEditingController = TextEditingController();

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      editingController: emailEditingController,
                      placeHolder: 'Email',
                      isObscure: false,
                      textInputType: TextInputType.emailAddress,
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
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          signIn(
                            emailEditingController.text,
                            passwordEditingController.text,
                          ).then((_) {
                            setState(() {
                              _isLoading = false;
                            });
                          });
                        },
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (uid) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (conext) {
                return Home();
              },
            ),
          );
          Fluttertoast.showToast(msg: 'Login Successfull');
        },
      );
    }
  }
}
