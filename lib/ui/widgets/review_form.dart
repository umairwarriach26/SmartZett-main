import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/booking/booking_controller.dart';

class ReviewForm extends GetView<BookingController> {
  const ReviewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        const ListTile(
          title: Text(
            "Review below information and attachments",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xffed1c24)),
          ),
        ),
        Card(
          elevation: 4.0,
          margin: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Column(
            children: [
              ListTile(
                  title: const Text(
                    "Visa Package",
                    style: TextStyle(color: Color(0xffed1c24)),
                  ),
                  trailing: IconButton(
                      onPressed: () => controller.currentStep(1),
                      icon: const Icon(Icons.edit))),
              ListTile(
                title: const Text("Entry Type",
                    style: TextStyle(color: Color(0xff0d4e96))),
                subtitle: Text("${controller.packageCapital}"),
              ),
            ],
          ),
        ),
        Card(
          elevation: 4.0,
          margin: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Column(
            children: [
              ListTile(
                  title: const Text(
                    "Package Detail",
                    style: TextStyle(color: Color(0xffed1c24)),
                  ),
                  trailing: IconButton(
                      onPressed: () => controller.currentStep(2),
                      icon: const Icon(Icons.edit))),
              ListTile(
                title: const Text("Visa Duration",
                    style: TextStyle(color: Color(0xff0d4e96))),
                subtitle: Text("${controller.packageDurationCoverted}"),
              ),
              ListTile(
                title: const Text("Process Duration",
                    style: TextStyle(color: Color(0xff0d4e96))),
                subtitle: Text("${controller.processDurationCapital}"),
              ),
              ListTile(
                title: const Text("Age Group",
                    style: TextStyle(color: Color(0xff0d4e96))),
                subtitle: Text("${controller.ageGroupCapial}"),
              ),
            ],
          ),
        ),
        Card(
          elevation: 4.0,
          margin: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Column(
            children: [
              ListTile(
                  title: const Text(
                    "Documents",
                    style: TextStyle(color: Color(0xffed1c24)),
                  ),
                  trailing: IconButton(
                      onPressed: () => controller.currentStep(3),
                      icon: const Icon(Icons.edit))),
              const ListTile(
                title: Text("Profile_Photo.png",
                    style: TextStyle(color: Color(0xff0d4e96))),
              ),
              const ListTile(
                title: Text("Passport_Photo.png",
                    style: TextStyle(color: Color(0xff0d4e96))),
              ),
            ],
          ),
        ),
        Card(
          elevation: 4.0,
          margin: const EdgeInsets.only(top: 4.0, bottom: 8.0),
          child: Column(
            children: [
              ListTile(
                  title: const Text(
                    "User Details",
                    style: TextStyle(color: Color(0xffed1c24)),
                  ),
                  trailing: IconButton(
                      onPressed: () => controller.currentStep(4),
                      icon: const Icon(Icons.edit))),
              ListTile(
                title: const Text(
                  "Name",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                subtitle: Text("${controller.fullName}"),
              ),
              ListTile(
                title: const Text(
                  "Email",
                  style: TextStyle(color: Color(0xff0d4e96)),
                ),
                subtitle: Text("${controller.email}"),
              ),
              ListTile(
                title: const Text("Date Of Birth",
                    style: TextStyle(color: Color(0xff0d4e96))),
                subtitle: Text("${controller.dob}"),
              ),
              ListTile(
                title: const Text("Phone #",
                    style: TextStyle(color: Color(0xff0d4e96))),
                subtitle: Text("${controller.phoneNo}"),
              ),
              ListTile(
                title: const Text("Passport #",
                    style: TextStyle(color: Color(0xff0d4e96))),
                subtitle: Text("${controller.passportNo}"),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.0,
          child: ElevatedButton(
              onPressed: () => Get.dialog(
                    AlertDialog(
                      title: const Text("Review Information"),
                      content: const Text(
                          "Make sure to review information before submission."),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Close"),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: const Text("Submit"),
                          onPressed: () {
                            Get.back();
                            controller.bookVisa();
                          },
                        )
                      ],
                    ),
                    barrierDismissible: false,
                  ),
              child: const Text("Submit")),
        )
      ],
    );
  }
}
