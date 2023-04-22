import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helpers/app_color.dart';
import '../widgets/custom_text_field.dart';
import '../services/post_data_to_firestore.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final _auth = FirebaseAuth.instance;

  TextEditingController firstNameEditingController = TextEditingController();

  TextEditingController secondNameEditingController = TextEditingController();

  TextEditingController emailEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();

  TextEditingController confirmPasswordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.mainColor),
        title: const Text(
          'Sign up',
          style: TextStyle(color: AppColor.mainColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
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
                      editingController: firstNameEditingController,
                      placeHolder: 'First name',
                      isObscure: false,
                      textInputType: TextInputType.name,
                    ),
                    CustomTextField(
                      editingController: secondNameEditingController,
                      placeHolder: 'Last name',
                      isObscure: false,
                      textInputType: TextInputType.name,
                    ),
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
                      textInputType: TextInputType.visiblePassword,
                    ),
                    CustomTextField(
                      editingController: confirmPasswordEditingController,
                      placeHolder: 'Confirm password',
                      isObscure: true,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            isLoading = true;
                          });
                          signUp(
                            emailEditingController.text,
                            passwordEditingController.text,
                          );
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: !isLoading
                            ? const Text(
                                'Sign up',
                                style: TextStyle(fontSize: 25.0),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                      ),
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

  Future<void> signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          PostDataToFirestore().postDetailsToFirestore(
            firstNameEditingController.text,
            secondNameEditingController.text,
            emailEditingController.text,
            context,
          );
        },
      ).catchError(
        (error) {
          Fluttertoast.showToast(msg: error!.message);
        },
      );
    }
  }
}
