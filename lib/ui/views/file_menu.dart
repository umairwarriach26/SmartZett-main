import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import '../../controllers/booking/booking_controller.dart';
import '../../models/documents_dto.dart';

class FileMenu extends GetView<BookingController> {
  const FileMenu({super.key, required this.destination});
  final int destination;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          const Divider(
            color: Colors.black,
            thickness: 1,
            indent: 140.0,
            endIndent: 140.0,
          ),
          ListTile(
            leading: const Icon(
              Icons.picture_as_pdf_rounded,
              color: Color(0xff0d4e96),
            ),
            title: const Text(
              "Choose pdf file",
              style: TextStyle(color: Color(0xff0d4e96)),
            ),
            onTap: () {
              Get.back();
              _pickPDF();
            },
          ),
          const Divider(thickness: 0.5),
          ListTile(
            leading: const Icon(
              Icons.image,
              color: Color(0xff0d4e96),
            ),
            title: const Text(
              "Choose from gallery",
              style: TextStyle(color: Color(0xff0d4e96)),
            ),
            onTap: () {
              Get.back();
              pickImage(1);
            },
          ),
          const Divider(thickness: 0.5),
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: Color(0xff0d4e96),
            ),
            title: const Text(
              "Capture from camera",
              style: TextStyle(color: Color(0xff0d4e96)),
            ),
            onTap: () {
              Get.back();
              pickImage(2);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        final File temp = File(file.path!);
        String? base64Image;
        base64Image = await fileToBase642(temp);
        if (destination == 1) {
          List<SingleFile> fileList = controller.allPassportPages;
          fileList.add(SingleFile(
              prefix: "data:application/pdf;base64",
              base64File: base64Image,
              fileName: file.name,
              type: "PDF",
              path: file.path));
          controller.setAllPassportPages(fileList);
        } else if (destination == 2) {
          List<SingleFile> fileList = controller.allStatementPages;
          fileList.add(SingleFile(
              prefix: "data:application/pdf;base64",
              base64File: base64Image,
              fileName: file.name,
              type: "PDF",
              path: file.path));
          controller.setAllStatementPages(fileList);
        } else if (destination == 3) {
          List<SingleFile> fileList = controller.profileImage;
          fileList.add(SingleFile(
              prefix: "data:application/pdf;base64",
              base64File: base64Image,
              fileName: file.name,
              type: "PDF",
              path: file.path));
          controller.setPassportProfile(fileList);
        } else if (destination == 4) {
          List<SingleFile> fileList = controller.nationalID;
          fileList.add(SingleFile(
              prefix: "data:application/pdf;base64",
              base64File: base64Image,
              fileName: file.name,
              type: "PDF",
              path: file.path));
          controller.setNationalID(fileList);
        } else if (destination == 5) {
          List<SingleFile> fileList = controller.passportImage;
          fileList.add(SingleFile(
              prefix: "data:application/pdf;base64",
              base64File: base64Image,
              fileName: file.name,
              type: "PDF",
              path: file.path));
          controller.setPassportImage(fileList);
        } else if (destination == 6) {
          List<SingleFile> fileList = controller.allSupplimnets;
          fileList.add(SingleFile(
              prefix: "data:application/pdf;base64",
              base64File: base64Image,
              fileName: file.name,
              type: "PDF",
              path: file.path));
          controller.setAllSuppliments(fileList);
        }
      } else {
        Get.snackbar("Action", "User close picker without file selection");
      }
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  // Future<void> _pickImage() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       allowMultiple: false,
  //       type: FileType.custom,
  //       allowedExtensions: ['jpg'],
  //     );
  //     if (result != null) {
  //       PlatformFile file = result.files.first;
  //       String? base64Image;
  //       base64Image = await fileToBase642(file.bytes!);
  //       if (destination == 1) {
  //         List<SingleFile> fileList = controller.allPassportPages;
  //         fileList.add(SingleFile(
  //             prefix: "",
  //             base64File: base64Image,
  //             fileName: file.name,
  //             type: "JPG",
  //             path: file.path));
  //         controller.setAllPassportPages(fileList);
  //       } else if (destination == 2) {
  //         List<SingleFile> fileList = controller.allStatementPages;
  //         fileList.add(SingleFile(
  //             prefix: "",
  //             base64File: base64Image,
  //             fileName: file.name,
  //             type: "JPG",
  //             path: file.path));
  //         controller.setAllStatementPages(fileList);
  //       } else if (destination == 3) {
  //         controller.setPassportProfile(SingleFile(
  //             prefix: "",
  //             base64File: base64Image,
  //             fileName: file.name,
  //             type: "JPG",
  //             path: file.path));
  //       } else if (destination == 4) {
  //         controller.setNationalID(SingleFile(
  //             prefix: "",
  //             base64File: base64Image,
  //             fileName: file.name,
  //             type: "JPG",
  //             path: file.path));
  //       } else if (destination == 5) {
  //         controller.setPassportImage(SingleFile(
  //             prefix: "",
  //             base64File: base64Image,
  //             fileName: file.name,
  //             type: "JPG",
  //             path: file.path));
  //       } else if (destination == 6) {
  //         List<SingleFile> fileList = controller.allSupplimnets;
  //         fileList.add(SingleFile(
  //             prefix: "",
  //             base64File: base64Image,
  //             fileName: file.name,
  //             type: "JPG",
  //             path: file.path));
  //         controller.setAllSuppliments(fileList);
  //       } else {
  //         Get.snackbar("Action", "User close picker without file selection");
  //       }
  //     }
  //   } on PlatformException catch (e) {
  //     Get.snackbar("Error", "${e.message}");
  //   } catch (e) {
  //     Get.snackbar("Error", "$e");
  //   }
  // }

  Future<void> pickImage(int type) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: type == 1 ? ImageSource.gallery : ImageSource.camera,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 10,
      );
      String? base64Image;
      base64Image = await fileToBase64(pickedFile!);
      if (destination == 1) {
        List<SingleFile> fileList = controller.allPassportPages;
        fileList.add(SingleFile(
            prefix: "data:image/png;base64",
            base64File: base64Image,
            fileName: pickedFile.name,
            type: "JPG",
            path: pickedFile.path));
        controller.setAllPassportPages(fileList);
      } else if (destination == 2) {
        List<SingleFile> fileList = controller.allStatementPages;
        fileList.add(SingleFile(
            prefix: "data:image/png;base64",
            base64File: base64Image,
            fileName: pickedFile.name,
            type: "JPG",
            path: pickedFile.path));
        controller.setAllStatementPages(fileList);
      } else if (destination == 3) {
        List<SingleFile> fileList = controller.profileImage;
        fileList.add(SingleFile(
            prefix: "data:image/png;base64",
            base64File: base64Image,
            fileName: pickedFile.name,
            type: "JPG",
            path: pickedFile.path));
        controller.setPassportProfile(fileList);
      } else if (destination == 4) {
        List<SingleFile> fileList = controller.nationalID;
        fileList.add(SingleFile(
            prefix: "data:image/png;base64",
            base64File: base64Image,
            fileName: pickedFile.name,
            type: "JPG",
            path: pickedFile.path));
        controller.setNationalID(fileList);
      } else if (destination == 5) {
        List<SingleFile> fileList = controller.passportImage;
        fileList.add(SingleFile(
            prefix: "data:image/png;base64",
            base64File: base64Image,
            fileName: pickedFile.name,
            type: "JPG",
            path: pickedFile.path));
        controller.setPassportImage(fileList);
      } else if (destination == 6) {
        List<SingleFile> fileList = controller.allSupplimnets;
        fileList.add(SingleFile(
            prefix: "data:image/png;base64",
            base64File: base64Image,
            fileName: pickedFile.name,
            type: "JPG",
            path: pickedFile.path));
        controller.setAllSuppliments(fileList);
      }
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  Future<String> fileToBase64(XFile file) async {
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<String> fileToBase642(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }
}
