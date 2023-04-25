import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/local_storage.dart';
import 'widgets/loading_dialog.dart';

class MenuPage extends GetView<LocalStorageService> {
  MenuPage({super.key});
  Future<bool> _onPop() async {
    return false;
  }

  // final appId = Platform.isAndroid ? "com.smarttravel.app" : "";
  // final url = Uri.parse(Platform.isAndroid ?
  //   "market://details?id=com.smarttravel.app":
  //   //"https://apps.apple.com/app/id$appId",
  // );

  final List<MenuItem> _menuItems = [
    MenuItem(
        title: "Profile",
        icon: Icons.person_2,
        onTap: () => Get.toNamed("/profile")),
    MenuItem(
        title: "About Us",
        icon: Icons.info_rounded,
        onTap: () => Get.toNamed("/about")),
    MenuItem(
        title: "Contact Us",
        icon: Icons.contact_emergency,
        onTap: () => Get.toNamed("/contact")),
    MenuItem(
        title: "Terms & Conditions",
        icon: Icons.list_rounded,
        onTap: () => Get.toNamed("/terms")),
    MenuItem(
        title: "Privacy Policy",
        icon: Icons.privacy_tip,
        onTap: () => Get.toNamed("/privacy")),
    MenuItem(
        icon: Icons.star,
        title: "Rate Our App",
        onTap: () => launchUrl(
              Uri.parse("market://details?id=com.smarttravel.app"),
              mode: LaunchMode.externalApplication,
            )),
    MenuItem(
        icon: Icons.share,
        title: "Share Our App",
        onTap: () => launchUrl(
              Uri.parse("market://details?id=com.smarttravel.app"),
              mode: LaunchMode.externalApplication,
            )),
    MenuItem(
      icon: Icons.code,
      title: "App Version(1.0.0)",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: _onPop,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
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
                Expanded(
                    child: ListView.separated(
                        itemCount: _menuItems.length,
                        separatorBuilder: (_, index) => const Divider(),
                        itemBuilder: (_, index) {
                          return MenuTile(
                              icon: _menuItems[index].icon,
                              title: _menuItems[index].title,
                              onTap: _menuItems[index].onTap);
                        })),
                SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () async {
                        Get.dialog(
                            const LoadingDialog(message: "Logging Out..."));
                        controller.user = null;
                        Timer(const Duration(seconds: 4), () async {
                          Get.offAllNamed("/login");
                        });
                      },
                      child: const Text("Log Out")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile({super.key, required this.title, this.icon, this.onTap});
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          color: const Color(0xff0d4e96),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Color(0xff0d4e96)),
        ),
        onTap: onTap);
  }
}

class MenuItem {
  MenuItem({required this.title, required this.icon, this.onTap});
  String title;
  IconData icon;
  VoidCallback? onTap;
}
