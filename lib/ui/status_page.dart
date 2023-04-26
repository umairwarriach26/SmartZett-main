import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

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
                children: const [
                  Text(
                    "Visa Status",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xff808285), fontSize: 25.0),
                  ),
                  SizedBox(height: 30)
                ],
              ),
            ),
          ],
        )),
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined,
                        color: Color(0xff808285)),
                    onPressed: () => Get.offAndToNamed("/home"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.playlist_add_outlined,
                        color: Color(0xff808285)),
                    onPressed: () => Get.toNamed("/booking"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.mobile_friendly,
                        color: Color(0xff0d4e96)),
                    onPressed: () {},
                  ),
                ],
              ),
            )),
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: const Color(0xff0d4e96),
        //     child: const Icon(Icons.dashboard_customize),
        //     onPressed: () => Get.toNamed("/booking")),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
