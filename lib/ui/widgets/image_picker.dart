import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartzett/controllers/booking/booking_controller.dart';

class ImageMenu extends StatelessWidget {
  ImageMenu({super.key, required this.type});
  final int type;
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
              Icons.image_outlined,
              color: Color(0xff0d4e96),
            ),
            title: const Text(
              "Gallery",
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
              Icons.camera_alt_outlined,
              color: Color(0xff0d4e96),
            ),
            title: const Text(
              "Camera",
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

  Future<void> pickImage(int source) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: source == 1 ? ImageSource.gallery : ImageSource.camera,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 10,
      );
      String? base64Image;
      if (type == 1) {
        base64Image = await imageToBase64(pickedFile!);
        controller.setProfile(base64Image);
      } else {
        base64Image = await imageToBase64(pickedFile!);
        controller.setPassport(base64Image);
      }
    } on PlatformException catch (e) {
      Get.snackbar("Error", "$e");
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  Future<String> imageToBase64(XFile file) async {
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }
}
