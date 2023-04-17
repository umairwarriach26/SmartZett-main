import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/local_storage.dart';
import 'widgets/loading_dialog.dart';

class MenuPage extends GetView<LocalStorageService> {
  const MenuPage({super.key});
  Future<bool> _onPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: _onPop,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Menu",
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
                ListTile(
                  leading: const Icon(
                    Icons.person_2_outlined,
                    color: Color(0xff0d4e96),
                  ),
                  title: const Text(
                    "Profile",
                    style: TextStyle(color: Color(0xff0d4e96)),
                  ),
                  onTap: () => Get.toNamed("/profile"),
                ),
                const Divider(thickness: 0.5),
                ListTile(
                  leading: const Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xff0d4e96),
                  ),
                  title: const Text(
                    "About Us",
                    style: TextStyle(color: Color(0xff0d4e96)),
                  ),
                  onTap: () => Get.toNamed("/about"),
                ),
                const Divider(thickness: 0.5),
                ListTile(
                  leading: const Icon(
                    Icons.contact_mail_outlined,
                    color: Color(0xff0d4e96),
                  ),
                  title: const Text(
                    "Contact Us",
                    style: TextStyle(color: Color(0xff0d4e96)),
                  ),
                  onTap: () => Get.toNamed("/contact"),
                ),
                const Divider(thickness: 0.5),
                ListTile(
                  leading: const Icon(
                    Icons.privacy_tip_outlined,
                    color: Color(0xff0d4e96),
                  ),
                  title: const Text(
                    "Privacy Policy",
                    style: TextStyle(color: Color(0xff0d4e96)),
                  ),
                  onTap: () => Get.toNamed("/privacy"),
                ),
                const Divider(thickness: 0.5),
                ListTile(
                  leading: const Icon(
                    Icons.logout_rounded,
                    color: Color(0xff0d4e96),
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Color(0xff0d4e96)),
                  ),
                  onTap: () async {
                    Get.dialog(const LoadingDialog(message: "Logging Out..."));
                    controller.user = null;
                    Timer(const Duration(seconds: 4), () async {
                      Get.offAllNamed("/login");
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
