import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'image_picker.dart';
import '../../controllers/booking/booking_controller.dart';

class DocumnetUploadForm extends GetView<BookingController> {
  const DocumnetUploadForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            const Text(
              "Make sure that all uploaded files are clear. Max file size: 9MB. Allowed file types:JPEG",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14.0),
            ),
            ListTile(
              title:
                  const Text("Profile Photo", style: TextStyle(fontSize: 16.0)),
              trailing: controller.profileImage == ""
                  ? const Icon(Icons.add)
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
              onTap: () => Get.bottomSheet(ImageMenu(type: 1)),
            ),
            ListTile(
              title: const Text("Passport Photo",
                  style: TextStyle(fontSize: 16.0)),
              trailing: controller.passportImage == ""
                  ? const Icon(
                      Icons.add,
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
              onTap: () => Get.bottomSheet(ImageMenu(type: 2)),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                  onPressed: () {
                    if (controller.passportImage == "" ||
                        controller.profileImage == "") {
                      Get.snackbar("Error", "Select both documnets to upload");
                    } else {
                      controller.currentStep(4);
                    }
                  },
                  child: const Text("Continue")),
            )
          ],
        ));
  }
}
