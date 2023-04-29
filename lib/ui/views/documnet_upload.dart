import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smartzett/models/documents_dto.dart';
import 'file_menu.dart';
import '../../controllers/booking/booking_controller.dart';

class DocumnetUploadForm extends GetView<BookingController> {
  const DocumnetUploadForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            const Text(
              "Upload Documents",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Make sure that all uploaded files are clear. Max file size: 9MB. Allowed file types:JPEG",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 50.0,
              child: OutlinedButton(
                onPressed: () =>
                    Get.bottomSheet(const FileMenu(destination: 5)),
                child: const Text("Upload Passport Image"),
              ),
            ),
            // SingleDocs(
            //     onTap: () => controller.removePassportImage(),
            //     list: controller.passportImage),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 50.0,
              child: OutlinedButton(
                onPressed: () =>
                    Get.bottomSheet(const FileMenu(destination: 3)),
                child: const Text("Upload Profile Image"),
              ),
            ),
            // SingleDocs(
            //     onTap: () => controller.removeProfileImage(),
            //     list: controller.profileImage),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 50.0,
              child: OutlinedButton(
                onPressed: () =>
                    Get.bottomSheet(const FileMenu(destination: 4)),
                child: const Text("Upload National ID"),
              ),
            ),
            // SingleDocs(
            //     onTap: () => controller.removeNationalId(),
            //     list: controller.nationalID),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 100.0,
              child: OutlinedButton(
                onPressed: () =>
                    Get.bottomSheet(const FileMenu(destination: 1)),
                child: const Text("Upload all pages of your passport +"),
              ),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.allPassportPages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: controller.allPassportPages[index].type == "PDF"
                          ? const FaIcon(FontAwesomeIcons.filePdf)
                          : Image.file(
                              File(
                                  "${controller.allPassportPages[index].path}"),
                              height: 60,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                      title: Text(
                          "${controller.allPassportPages[index].fileName}\n(${index + 1} of 3 )",
                          style: const TextStyle(fontSize: 16.0)),
                      trailing: IconButton(
                          onPressed: () => controller.removePassportPages(
                              controller.allPassportPages[index]),
                          icon: const Icon(Icons.delete)));
                }),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 100.0,
              child: OutlinedButton(
                onPressed: () =>
                    Get.bottomSheet(const FileMenu(destination: 2)),
                child: const Text("Upload all pages of your bank statement+"),
              ),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.allStatementPages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: controller.allStatementPages[index].type == "PDF"
                          ? const FaIcon(FontAwesomeIcons.filePdf)
                          : Image.file(
                              File(
                                  "${controller.allStatementPages[index].path}"),
                              height: 60,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                      title: Text(
                          "${controller.allStatementPages[index].fileName}\n(${index + 1} of 3 )",
                          style: const TextStyle(fontSize: 16.0)),
                      trailing: IconButton(
                          onPressed: () => controller.removeStatementPages(
                              controller.allStatementPages[index]),
                          icon: const Icon(Icons.delete)));
                }),
            const SizedBox(height: 10.0),
            const Text(
              "Suppliment Documnets",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Upload Additional Supporting Documnet",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 100.0,
              child: OutlinedButton(
                onPressed: () =>
                    Get.bottomSheet(const FileMenu(destination: 6)),
                child: const Text("Upload Documents +"),
              ),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.allSupplimnets.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: controller.allSupplimnets[index].type == "PDF"
                          ? const FaIcon(FontAwesomeIcons.filePdf)
                          : Image.file(
                              File("${controller.allSupplimnets[index].path}"),
                              height: 60,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                      title: Text(
                          "${controller.allSupplimnets[index].fileName}\n(${index + 1} of 3 )",
                          style: const TextStyle(fontSize: 16.0)),
                      trailing: IconButton(
                          onPressed: () => controller.removeSuppliments(
                              controller.allSupplimnets[index]),
                          icon: const Icon(Icons.delete)));
                }),
            const SizedBox(height: 40.0),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                  onPressed: () {
                    controller.currentStep(4);
                    // if (controller.passportImage == "" ||
                    //     controller.passportProfileImage == "") {
                    //   Get.snackbar("Error", "Select both documnets to upload");
                    // } else {
                    //   controller.currentStep(4);
                    // }
                  },
                  child: const Text("Continue")),
            )
          ],
        ));
  }
}

// ignore: must_be_immutable
class SingleDocs extends StatelessWidget {
  SingleDocs({super.key, required this.onTap, required this.list});
  VoidCallback onTap;
  List<SingleFile> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: list[index].type == "PDF"
                  ? const FaIcon(FontAwesomeIcons.filePdf)
                  : Image.file(
                      File("${list[index].path}"),
                      height: 60,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
              title: Text("${list[index].fileName}",
                  style: const TextStyle(fontSize: 16.0)),
              trailing:
                  IconButton(onPressed: onTap, icon: const Icon(Icons.delete)));
        });
  }
}
