import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartzett/controllers/booking/booking_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:smartzett/models/documents_dto.dart';

class FileMenu extends StatelessWidget {
  FileMenu({super.key, required this.destination});
  final int destination;
  final controller = Get.find<BookingController>();
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
              Icons.file_copy,
              color: Color(0xff0d4e96),
            ),
            title: const Text(
              "File PDF",
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
              "Pick Image From Gallery",
              style: TextStyle(color: Color(0xff0d4e96)),
            ),
            onTap: () {
              Get.back();
              _pickImage();
            },
          ),
          const Divider(thickness: 0.5),
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: Color(0xff0d4e96),
            ),
            title: const Text(
              "Take Camera Photo",
              style: TextStyle(color: Color(0xff0d4e96)),
            ),
            onTap: () {
              Get.back();
              pickImageCamera();
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
        if (destination == 1) {
          List<SingleFile> fileList = controller.allPassportPages;
          fileList.add(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "PDF",
              path: file.path));
          controller.setAllPassportPages(fileList);
        } else if (destination == 2) {
          List<SingleFile> fileList = controller.allStatementPages;
          fileList.add(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "PDF",
              path: file.path));
          controller.setAllStatementPages(fileList);
        } else if (destination == 3) {
          controller.setPassportProfile(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "PDF",
              path: file.path));
        } else if (destination == 4) {
          controller.setNationalID(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "PDF",
              path: file.path));
        } else if (destination == 5) {
          controller.setPassportImage(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "PDF",
              path: file.path));
        } else if (destination == 6) {
          List<SingleFile> fileList = controller.allSupplimnets;
          fileList.add(SingleFile(
              prefix: "",
              base64File: "",
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

  Future<void> _pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg'],
      );
      if (result != null) {
        PlatformFile file = result.files.first;
        if (destination == 1) {
          List<SingleFile> fileList = controller.allPassportPages;
          fileList.add(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "JPG",
              path: file.path));
          controller.setAllPassportPages(fileList);
        } else if (destination == 2) {
          List<SingleFile> fileList = controller.allStatementPages;
          fileList.add(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "JPG",
              path: file.path));
          controller.setAllStatementPages(fileList);
        } else if (destination == 3) {
          controller.setPassportProfile(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "JPG",
              path: file.path));
        } else if (destination == 4) {
          controller.setNationalID(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "JPG",
              path: file.path));
        } else if (destination == 5) {
          controller.setPassportImage(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "JPG",
              path: file.path));
        } else if (destination == 6) {
          List<SingleFile> fileList = controller.allSupplimnets;
          fileList.add(SingleFile(
              prefix: "",
              base64File: "",
              fileName: file.name,
              type: "JPG",
              path: file.path));
          controller.setAllSuppliments(fileList);
        } else {
          Get.snackbar("Action", "User close picker without file selection");
        }
      }
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  Future<void> pickImageCamera() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 10,
      );
      String? base64Image;
      base64Image = await imageToBase64(pickedFile!);
      controller.setPassport(base64Image);
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  Future<String> imageToBase64(XFile file) async {
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }
}
