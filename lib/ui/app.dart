import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartzett/controllers/mybooking/mybooking_binding.dart';
import 'package:smartzett/ui/about_page.dart';
import 'package:smartzett/ui/contact_page.dart';
import 'package:smartzett/ui/mybookings_page.dart';
import 'package:smartzett/ui/privacy_page.dart';
import 'package:smartzett/ui/profile_page.dart';
import 'package:smartzett/ui/terms_page.dart';
import 'booking_page.dart';
import 'menu_page.dart';
import 'splash_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'home_page.dart';
import 'status_page.dart';
import '../controllers/auth/auth_binding.dart';
import '../controllers/booking/booking_binding.dart';
import '../config/app/app_theme.dart';

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
            page: () => ProfilePage(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(milliseconds: 350)),
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
          page: () => const StatusPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 350),
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
          binding: StatusBinding(),
        ),
      ],
    );
  }
}
