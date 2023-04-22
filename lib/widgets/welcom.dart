import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final String imageUrl;
  final String description;
  const Welcome({
    required this.imageUrl,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 150.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 250,
              height: 250,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
