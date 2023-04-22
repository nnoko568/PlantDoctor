import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/welcom.dart';
import '../widgets/home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  bool isLastPage = false;
  bool isFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
              setState(() => isFirstPage = index == 0);
            },
            controller: _pageController,
            children: const [
              Welcome(
                imageUrl: 'assets/images/Online-Doctor-amico.png',
                description: 'Easy dignosis for your plant',
              ),
              Welcome(
                imageUrl: 'assets/images/Seeding-bro.png',
                description: 'Get treatment for your plant',
              ),
              Welcome(
                imageUrl: 'assets/images/Mango-tree-pana.png',
                description: 'A disease free and healthy plant',
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.55),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              axisDirection: Axis.horizontal,
              effect: ExpandingDotsEffect(
                spacing: 20.0,
                radius: 10.0,
                dotWidth: 15.0,
                dotHeight: 15.0,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.5,
                dotColor: Colors.grey.withOpacity(0.3),
                activeDotColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: !isFirstPage
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (!isFirstPage)
                  TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    },
                    child: Text(
                      "Previous",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    if (isLastPage) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Home();
                          },
                        ),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    }
                  },
                  child: Text(
                    isLastPage ? "Start" : "Next",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
