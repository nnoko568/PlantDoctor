import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/users.dart';
import '../widgets/home.dart';

class PostDataToFirestore {
  Future<void> postDetailsToFirestore(String firstName, String lastName,
      String email, BuildContext context) async {
    // calling our firestore
    // calling our user provider
    // sending these values
    final _auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    Users users = Users();

    // writing all the values
    users.firstName = firstName;
    users.lastName = lastName;
    users.email = email;

    await firebaseFirestore
        .collection("users")
        .doc(user!.uid)
        .set(users.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :)");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }
}
