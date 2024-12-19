import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.off(()=> MainScreen());});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage('assets/images/icons/app_logo.jpg'),
        ),
      ),
    );
  }
}
