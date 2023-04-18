import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
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
          child: Column(
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
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.person_2,
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
                        Icons.info,
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
                        Icons.contact_emergency,
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
                        Icons.list_rounded,
                        color: Color(0xff0d4e96),
                      ),
                      title: const Text(
                        "Terms & Conditions",
                        style: TextStyle(color: Color(0xff0d4e96)),
                      ),
                      onTap: () => Get.toNamed("/terms"),
                    ),
                    const Divider(thickness: 0.5),
                    ListTile(
                      leading: const Icon(
                        Icons.privacy_tip,
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
                        Icons.star_rate,
                        color: Color(0xff0d4e96),
                      ),
                      title: const Text(
                        "Rate Our App",
                        style: TextStyle(color: Color(0xff0d4e96)),
                      ),
                      onTap: () => _rateShareApp(),
                    ),
                    const Divider(thickness: 0.5),
                    ListTile(
                      leading: const Icon(
                        Icons.share,
                        color: Color(0xff0d4e96),
                      ),
                      title: const Text(
                        "Share Our App",
                        style: TextStyle(color: Color(0xff0d4e96)),
                      ),
                      onTap: () => _rateShareApp(),
                    ),
                    const Divider(thickness: 0.5),
                    ListTile(
                      leading: const Icon(
                        Icons.logout_sharp,
                        color: Color(0xff0d4e96),
                      ),
                      title: const Text(
                        "Logout",
                        style: TextStyle(color: Color(0xff0d4e96)),
                      ),
                      onTap: () async {
                        Get.dialog(
                            const LoadingDialog(message: "Logging Out..."));
                        controller.user = null;
                        Timer(const Duration(seconds: 4), () async {
                          Get.offAllNamed("/login");
                        });
                      },
                    ),
                    const Divider(thickness: 0.5),
                    const ListTile(
                      title: Text(
                        "App Version 1.0.0",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xffed1c24)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _rateShareApp() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final appId = Platform.isAndroid ? "com.smarttravel.app" : "";
      final url = Uri.parse(
        Platform.isAndroid
            ? "market://details?id=$appId"
            : "https://apps.apple.com/app/id$appId",
      );
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
