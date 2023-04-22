import 'package:flutter/material.dart';

import '../helpers/app_color.dart';

class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Tomatoe',
          style: TextStyle(color: AppColor.mainColor),
        ),
        iconTheme: const IconThemeData(color: AppColor.mainColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Tomato-Disease.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60.0,
              color: AppColor.mainColor,
              alignment: Alignment.center,
              child: const Text(
                'Disease detected',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Late Blight tomatoe disease',
                style: TextStyle(fontSize: 28.0, color: AppColor.mainColor),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // symptoms section
                  Text(
                    'Symptoms',
                    style: TextStyle(
                      color: AppColor.lightGray,
                      fontSize: 18.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'This is just some random text that I am putting here to fill up space so that it should look like actual text that make sense. Hahahahaha I sorry who ever will think the text here makes sence. Kawabanga :)',
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                  // Causes section
                  Text(
                    'Causes',
                    style: TextStyle(
                      color: AppColor.lightGray,
                      fontSize: 18.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'This is just some random text that I am putting here to fill up space so that it should look like actual text that make sense. Hahahahaha I sorry who ever will think the text here makes sence. Kawabanga :)',
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Text(
                    'Treatment',
                    style: TextStyle(
                      color: AppColor.lightGray,
                      fontSize: 18.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '1) This another of some of my random text that I like to use to fill up space in my flutter app. Kawabanga :)',
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '2) This another of some of my random text that I like to use to fill up space in my flutter app. Kawabanga :)',
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '3) This another of some of my random text that I like to use to fill up space in my flutter app. Kawabanga :)',
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '4) This another of some of my random text that I like to use to fill up space in my flutter app. Kawabanga :)',
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
