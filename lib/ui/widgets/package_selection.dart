import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/booking/booking_controller.dart';

class PackageSelection extends GetView<BookingController> {
  const PackageSelection({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        const Text(
          "Explore UAE",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        const SizedBox(height: 10.0),
        const Text(
          "Economic and political stability, religiously and culturally tolerant population, a range of events and activities make the UAE an ideal tourist destination.",
          style: TextStyle(fontSize: 14.0),
        ),
        const SizedBox(height: 10.0),
        const Text(
          "Choose Visa Package",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Obx(
          () => Column(
            children: [
              CheckboxListTile(
                title: const Text("Single Entry",
                    style: TextStyle(fontSize: 16.0)),
                value: controller.package == "1",
                onChanged: (bool? value) {
                  controller.setPackage("1");
                  controller.getUpdatedPrice();
                  //controller.currentStep(2);
                },
              ),
              CheckboxListTile(
                title:
                    const Text("Multi Entry", style: TextStyle(fontSize: 16.0)),
                value: controller.package == "2",
                onChanged: (bool? value) {
                  controller.setPackage("2");
                  controller.getUpdatedPrice();
                  //controller.currentStep(2);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
