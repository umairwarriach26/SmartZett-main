import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookindsPage extends StatelessWidget {
  const MyBookindsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "My Bookings",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color(0xff808285), fontSize: 25.0),
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
    ));
  }
}
