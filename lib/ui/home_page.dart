import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/local_storage.dart';

class HomePage extends GetView<LocalStorageService> {
  const HomePage({super.key});

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Smart Travel",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Color(0xff808285), fontSize: 25.0),
                      ),
                      IconButton(
                          onPressed: () => Get.toNamed("/menu"),
                          icon: const Icon(Icons.menu_rounded,
                              color: Color(0xff0d4e96)))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Welcome\n${controller.user!.firstName ?? ""} ${controller.user!.lastName ?? ""}",
                    textAlign: TextAlign.start,
                    style:
                        const TextStyle(color: Colors.black26, fontSize: 22.0),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: HomeTile(
                            title: "UAE TOURIST VISA",
                            icon: const Icon(
                              Icons.playlist_add_outlined,
                              size: 60.0,
                              color: Colors.white,
                            ),
                            image: "assets/images/visabg.jpg",
                            onTap: () => Get.toNamed("/booking")),
                      ),
                      Expanded(
                        child: HomeTile(
                            title: "VISA STATUS",
                            icon: const Icon(
                              Icons.mobile_friendly,
                              size: 60.0,
                              color: Colors.white,
                            ),
                            image: "assets/images/statusbg.jpg",
                            onTap: () => Get.offAndToNamed("/status")),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: HomeTile(
                            title: "MY BOOKINGS",
                            icon: const Icon(
                              Icons.menu_book_rounded,
                              size: 60.0,
                              color: Colors.white,
                            ),
                            image: "assets/images/bookingsbg.jpg",
                            onTap: () {}),
                      ),
                      Expanded(
                        child: HomeTile(
                            title: "TRAVEL UPDATES",
                            icon: const Icon(
                              Icons.newspaper_rounded,
                              size: 60.0,
                              color: Colors.white,
                            ),
                            image: "assets/images/updatesbg.jpg",
                            onTap: () {}),
                      )
                    ],
                  ),
                )
              ]),
        ),
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_rounded,
                        color: Color(0xff0d4e96)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.playlist_add_outlined,
                        color: Color(0xff808285)),
                    onPressed: () => Get.toNamed("/booking"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.mobile_friendly,
                        color: Color(0xff808285)),
                    onPressed: () => Get.offAndToNamed("/status"),
                  ),
                ],
              ),
            )),
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: const Color(0xffed1c24),
        //     child: const Icon(Icons.dashboard_customize),
        //     onPressed: () => Get.toNamed("/booking")),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  const HomeTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.image,
      required this.onTap});

  final String title;
  final Icon icon;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              )
            ],
          )),
    );
  }
}
