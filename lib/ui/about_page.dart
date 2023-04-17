import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  Future<bool> _onPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "About Us",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(color: Color(0xff808285), fontSize: 25.0),
                    ),
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.cancel_outlined,
                            color: Color(0xff0d4e96)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
