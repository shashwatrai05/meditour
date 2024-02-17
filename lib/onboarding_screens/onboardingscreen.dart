import 'package:flutter/material.dart';
import 'package:meditour/homescreen.dart';
import './obscreen1.dart';
import './obscreen2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    children: const [
                      ObScreen1(),
                      ObScreen2(),
                    ],
                  ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        fixedSize: const Size(80, 41),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Salmapro',
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 2; i++)
                          DotIndicator(
                            isActive: i == currentPage,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: currentPage == 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.blue.shade100,
                      backgroundColor: Colors.blue.shade800,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.8, 50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: 'Salmapro',
                          color: Color(0xffffffff),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: currentPage != 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 23.0,
                  right: 23.0,
                ),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.blue.shade100,
                      backgroundColor: Colors.blue.shade800,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.8, 50),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: isActive ? 7 : 5,
      width: isActive ? 34 : 5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}