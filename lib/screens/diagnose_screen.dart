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
                      'The earliest symptoms of late blight are going to be irregularly shaped gray and yellow spots on the leaves and on the stem of your plant. A fuzzy white mold might also appear around those spots.',
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
                      'Late Blight is caused by a fungus, phytophthora infestans. It’s a fungus that has adapted for growth where water is present and cool temperatures persist. The moist conditions allow spores to spread among plants by splashing rain, overhead irrigation, and wind.',
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
                      '1. Keep the plant as dry as possible. Use something like drip irrigation near the base of the plant or water with a hose directly at the base instead of from above the whole plant.',
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '2. Uproot and quickly dispose of any infected plants in your garden. You can bury them deep in the soil outside of your garden or put them into your garbage can.',
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '3. Look for late-blight resistant varieties of tomatoes.',
                      style: TextStyle(
                        fontSize: 20.0,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '4. Use a fungicide that contains bacillus subtillis, a bacterium that will stay in your soil and control several different diseases for an extended period of time.',
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
