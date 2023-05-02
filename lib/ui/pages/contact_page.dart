import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
  Future<bool> _onPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Contact Us",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xff808285), fontSize: 25.0),
                  ),
                  TextButton(
                    child: const Text("< Back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0d4e96))),
                    onPressed: () => Get.back(),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Socials",
                textAlign: TextAlign.start,
                style: TextStyle(color: Color(0xff808285), fontSize: 20.0),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () => _openSocialApps(
                          "https://www.facebook.com/smarttravelsuae"),
                      icon: const FaIcon(FontAwesomeIcons.facebook,
                          color: Color(0xff0d4e96))),
                  const SizedBox(width: 20),
                  IconButton(
                      onPressed: () =>
                          _openSocialApps("https://twitter.com/smarttraveluae"),
                      icon: const FaIcon(FontAwesomeIcons.twitter,
                          color: Color(0xff0d4e96))),
                  const SizedBox(width: 20),
                  IconButton(
                      onPressed: () => _openSocialApps(
                          "https://www.instagram.com/smarttraveluae/"),
                      icon: const FaIcon(FontAwesomeIcons.squareInstagram,
                          color: Color(0xff0d4e96))),
                  const SizedBox(width: 20),
                  IconButton(
                      onPressed: () => _openSocialApps(
                          "https://ae.linkedin.com/company/smart-travel-llc"),
                      icon: const FaIcon(FontAwesomeIcons.linkedin,
                          color: Color(0xff0d4e96))),
                ],
              ),
              const Divider(thickness: 0.5),
              const Text(
                "Reach us at",
                textAlign: TextAlign.start,
                style: TextStyle(color: Color(0xff808285), fontSize: 20.0),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () => _openWhatsApp(),
                      icon: const FaIcon(FontAwesomeIcons.squareWhatsapp,
                          color: Color(0xff0d4e96))),
                  const SizedBox(width: 20),
                  IconButton(
                      onPressed: () => _makePhoneCall("+971524306776"),
                      icon: const FaIcon(FontAwesomeIcons.phone,
                          color: Color(0xff0d4e96))),
                  const SizedBox(width: 20),
                  IconButton(
                      onPressed: () => _sendSMS("+971524306776"),
                      icon: const FaIcon(FontAwesomeIcons.commentSms,
                          color: Color(0xff0d4e96))),
                  const SizedBox(width: 20),
                  IconButton(
                      onPressed: () => _sendMail(),
                      icon: const Icon(Icons.email_rounded,
                          color: Color(0xff0d4e96))),
                ],
              ),
              const Divider(thickness: 0.5),
              const Text(
                "Our Offices you can reach",
                textAlign: TextAlign.start,
                style: TextStyle(color: Color(0xff808285), fontSize: 20.0),
              ),
              ListTile(
                leading:
                    const Icon(Icons.location_city, color: Color(0xff0d4e96)),
                title: const Text(
                  "Smart Travel LLC - Al Mina Road, Sharjah - UAE P.O BOX 72088",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                onTap: () => Get.bottomSheet(const OfficeMenu(
                    country: "United Arab Emirates",
                    title:
                        "Smart Travel LLC - Al Mina Road, Sharjah - UAE P.O BOX 72088",
                    phoneNo: "+97165691111",
                    location: "25.351987, 55.385507")),
              ),
              ListTile(
                leading:
                    const Icon(Icons.location_city, color: Color(0xff0d4e96)),
                title: const Text(
                  "Smart Travel - Abu Hail Dubai UAE",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                onTap: () => Get.bottomSheet(const OfficeMenu(
                    country: "United Arab Emirates",
                    title: "Smart Travel - Abu Hail Dubai UAE",
                    phoneNo: "+97142737777",
                    location: "25.278374789548618, 55.35091083801232")),
              ),
              ListTile(
                leading:
                    const Icon(Icons.location_city, color: Color(0xff0d4e96)),
                title: const Text(
                  "Smart Travel - Payannur Kerala India P.O 670307",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                onTap: () => Get.bottomSheet(const OfficeMenu(
                    country: "India",
                    title: "Smart Travel - Payannur Kerala India P.O 670307",
                    phoneNo: "+914985217911",
                    location: "12.106046592986914, 75.20466215301012")),
              ),
              const Divider(thickness: 0.5),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openWhatsApp() async {
    var contact = "+971 504874263 ";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(androidUrl),
            mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse(iosUrl),
            mode: LaunchMode.externalApplication);
      }
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    }
  }

  Future<void> _openSocialApps(String url) async {
    try {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      await launchUrl(launchUri);
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    }
  }

  Future<void> _sendSMS(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    try {
      await launchUrl(launchUri);
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    }
  }

  Future<void> _sendMail() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: "info@smartzett.com",
    );
    try {
      await launchUrl(launchUri);
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    }
  }
}

class OfficeMenu extends StatelessWidget {
  const OfficeMenu(
      {super.key,
      required this.country,
      required this.title,
      required this.phoneNo,
      required this.location});

  final String country;
  final String title;
  final String phoneNo;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                25.0,
              ),
              topRight: Radius.circular(25.0))),
      child: Wrap(
        runSpacing: 15.0,
        children: [
          const Divider(
            thickness: 1,
            indent: 130.0,
            endIndent: 130.0,
            color: Colors.black,
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.mapLocation,
                color: Color(0xff0d4e96)),
            title: Text(
              country,
              style: const TextStyle(color: Color(0xff0d4e96)),
            ),
            subtitle: Text(
              title,
              style: const TextStyle(color: Color(0xff808285)),
            ),
            onTap: () => _openLocationMap(location),
          ),
          ListTile(
            leading:
                const FaIcon(FontAwesomeIcons.phone, color: Color(0xff0d4e96)),
            title: Text(
              phoneNo,
              style: const TextStyle(color: Color(0xff0d4e96)),
            ),
            onTap: () => _makePhoneCall(phoneNo),
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      await launchUrl(launchUri);
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    }
  }

  Future<void> _openLocationMap(String location) async {
    try {
      await launchUrl(
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$location"),
        mode: LaunchMode.externalApplication,
      );
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    }
  }
}
