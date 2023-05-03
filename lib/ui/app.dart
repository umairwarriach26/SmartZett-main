import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartzett/controllers/status/status_binding.dart';
import 'package:smartzett/ui/pages/update_profile.dart';

import '../controllers/auth/auth_binding.dart';
import '../controllers/booking/booking_binding.dart';
import '../config/app/app_theme.dart';
import '../controllers/mybooking/mybooking_binding.dart';
import '../controllers/profile/profile_binding.dart';

import 'pages/about_page.dart';
import 'pages/booking_page.dart';
import 'pages/contact_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/menu_page.dart';
import 'pages/mybookings_page.dart';
import 'pages/privacy_page.dart';
import 'pages/profile_page.dart';
import 'pages/signup_page.dart';
import 'pages/splash_page.dart';
import 'pages/status_page.dart';
import 'pages/terms_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Smart Travels",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: "/",
      initialBinding: AuthBinding(),
      getPages: [
        GetPage(name: "/", page: () => const SplashPage()),
        GetPage(
          name: "/login",
          page: () => LoginPage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: "/signup",
          page: () => SignupPage(),
          binding: AuthBinding(),
        ),
        GetPage(
            name: "/home",
            page: () => const HomePage(),
            transition: Transition.leftToRight,
            transitionDuration: const Duration(milliseconds: 350)),
        GetPage(
            name: "/menu",
            page: () => MenuPage(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(milliseconds: 350)),
        GetPage(
          name: "/profile",
          page: () => const ProfilePage(),
          transition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 350),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: "/updateprofile",
          page: () => UpdateProfilePage(),
          transition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 350),
          binding: ProfileBinding(),
        ),
        GetPage(
            name: "/about",
            page: () => const AboutPage(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(milliseconds: 350)),
        GetPage(
            name: "/contact",
            page: () => const ContactPage(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(milliseconds: 350)),
        GetPage(
            name: "/privacy",
            page: () => const PrivacyPage(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(milliseconds: 350)),
        GetPage(
            name: "/terms",
            page: () => const TermsPage(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(milliseconds: 350)),
        GetPage(
          name: "/status",
          page: () => StatusPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 350),
          binding: StatusBinding(),
        ),
        GetPage(
          name: "/booking",
          page: () => const BookingPage(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 350),
          binding: BookingBinding(),
        ),
        GetPage(
          name: "/mybookings",
          page: () => const MyBookindsPage(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 350),
          binding: MyBookingBinding(),
        ),
      ],
    );
  }
}
