import 'package:flutter/material.dart';
import 'package:meditour/NearbyHospitals.dart';
import 'package:meditour/model/list_hospital.dart';
import 'package:meditour/onboarding_screens/onboardingscreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ImageProvider logo = const AssetImage('assets/logo.jpeg');
  gotoHome() async {
    await Future.delayed(const Duration(seconds: 2));
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>  HomeScreen(
    //     hospitals: generateDummyHospitals(), // Replace with your data source
    //   ),
    //     ));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  OnboardingScreen()
        ));
    
  }
  @override
  void initState() {
    super.initState();
    gotoHome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: logo,
              height: MediaQuery.of(context).size.width*0.8,
            ),
          )
        ],
      ),
    );
  }
}