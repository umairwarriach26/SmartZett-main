import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () async {
      Get.offAndToNamed("/login");
    });
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Image.asset(
          "assets/images/logo.png",
          scale: 3,
        )),
      ),
    );
  }
}
