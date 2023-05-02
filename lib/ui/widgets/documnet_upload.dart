import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smartzett/data/dtos/documents_dto.dart';
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
            controller.showPassport
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 50.0,
                        child: OutlinedButton(
                          onPressed: () => Get.bottomSheet(
                              const FileMenu(destination: "passport")),
                          child: const Text("Upload Passport Image"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      controller.passportImage.fileName == ""
                          ? const SizedBox()
                          : SingleDocs(
                              onTap: () => controller.removePassportImage(),
                              singleFile: controller.passportImage),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 10.0),
            controller.showProfile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 50.0,
                        child: OutlinedButton(
                          onPressed: () => Get.bottomSheet(
                              const FileMenu(destination: "profile")),
                          child: const Text("Upload Profile Image"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      controller.profileImage.fileName == ""
                          ? const SizedBox()
                          : SingleDocs(
                              onTap: () => controller.removeProfileImage(),
                              singleFile: controller.profileImage),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 10.0),
            controller.showNationalId
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 50.0,
                        child: OutlinedButton(
                          onPressed: () => Get.bottomSheet(
                              const FileMenu(destination: "nationalid")),
                          child: const Text("Upload National ID"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      controller.nationalID.fileName == ""
                          ? const SizedBox()
                          : SingleDocs(
                              onTap: () => controller.removeNationalId(),
                              singleFile: controller.nationalID),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 10.0),
            controller.showRelativePassport
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 50.0,
                        child: OutlinedButton(
                          onPressed: () => Get.bottomSheet(
                              const FileMenu(destination: "relativepassport")),
                          child: const Text("Upload Relative Passport"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      controller.relativePassport.fileName == ""
                          ? const SizedBox()
                          : SingleDocs(
                              onTap: () => controller.removeRelativePassport(),
                              singleFile: controller.relativePassport),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 10.0),
            controller.showRelativeVisa
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 50.0,
                        child: OutlinedButton(
                          onPressed: () => Get.bottomSheet(
                              const FileMenu(destination: "relativevisa")),
                          child: const Text("Upload Relative Visa"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      controller.relativeVisa.fileName == ""
                          ? const SizedBox()
                          : SingleDocs(
                              onTap: () => controller.removeRelativeVisa(),
                              singleFile: controller.relativeVisa),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 10.0),
            controller.showAllPassport
                ? Column(
                    children: [
                      SizedBox(
                        height: 100.0,
                        child: OutlinedButton(
                          onPressed: () => Get.bottomSheet(
                              const FileMenu(destination: "allpassport")),
                          child:
                              const Text("Upload all pages of your passport +"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.allPassportPages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                leading:
                                    controller.allPassportPages[index].type ==
                                            "PDF"
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
                                    onPressed: () =>
                                        controller.removePassportPages(
                                            controller.allPassportPages[index]),
                                    icon: const Icon(Icons.delete)));
                          }),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 10.0),
            controller.showAllBankStatement
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 100.0,
                        child: OutlinedButton(
                          onPressed: () => Get.bottomSheet(
                              const FileMenu(destination: "allstatement")),
                          child: const Text(
                              "Upload all pages of your bank statement+"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.allStatementPages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                leading:
                                    controller.allStatementPages[index].type ==
                                            "PDF"
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
                                    onPressed: () => controller
                                        .removeStatementPages(controller
                                            .allStatementPages[index]),
                                    icon: const Icon(Icons.delete)));
                          }),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 10.0),
            const Text(
              "Additional Documnets",
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
                    Get.bottomSheet(const FileMenu(destination: "additional")),
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
  SingleDocs({super.key, required this.onTap, required this.singleFile});
  VoidCallback onTap;
  SingleFile singleFile;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: singleFile.type == "PDF"
            ? const FaIcon(FontAwesomeIcons.filePdf)
            : Image.file(
                File("${singleFile.path}"),
                height: 60,
                width: 100,
                fit: BoxFit.cover,
              ),
        title: Text("${singleFile.fileName}",
            style: const TextStyle(fontSize: 16.0)),
        trailing: IconButton(onPressed: onTap, icon: const Icon(Icons.delete)));
  }
}
