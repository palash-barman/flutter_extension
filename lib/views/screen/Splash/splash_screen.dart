import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override
  void initState() {
    super.initState();

    // Simulate some initialization work
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to home screen or another screen after splash
      Get.offNamed(AppRoutes.homeScreen);
    });

  
  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
