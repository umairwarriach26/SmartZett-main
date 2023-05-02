import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile/profile_controller.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getUserProfile();
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Profile",
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
          ),
          controller.obx(
              (state) => Expanded(
                      child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      const Icon(Icons.person,
                          size: 100, color: Color(0xff0d4e96)),
                      const SizedBox(height: 10.0),
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text(
                          "First Name",
                          style: TextStyle(color: Color(0xff0d4e96)),
                        ),
                        subtitle: Text("${state!.firstName}"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text(
                          "Last Name",
                          style: TextStyle(color: Color(0xff0d4e96)),
                        ),
                        subtitle: Text("${state.lastName}"),
                      ),
                      const SizedBox(height: 10.0),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: const Text(
                          "Email",
                          style: TextStyle(color: Color(0xff0d4e96)),
                        ),
                        subtitle: Text("${state.email}"),
                      ),
                      const SizedBox(height: 10.0),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: const Text(
                          "Phone",
                          style: TextStyle(color: Color(0xff0d4e96)),
                        ),
                        subtitle: Text("${state.phone}"),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () => Get.toNamed("/updateprofile"),
                            child: const Text("Update")),
                      ),
                    ],
                  )),
              onLoading: const LoadingWidget(message: "Loading..."),
              onError: (error) => ErrorView(
                  errorMessage: "$error",
                  onPressed: () => controller.refreshView())),
        ],
      ),
    ));
  }
}
