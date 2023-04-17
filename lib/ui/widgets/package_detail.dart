import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartzett/models/price_model.dart';
import '../../controllers/booking/booking_controller.dart';

class PackageDetail extends GetView<BookingController> {
  const PackageDetail({super.key, required this.model});
  final PriceModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: ListView(
          children: [
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
              child: Column(
                children: const [
                  Text(
                    "Choose your preferred VISA Package",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Visa Package Price may vary",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Medical Insurance (COVID)",
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      "Included",
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                )),
            const SizedBox(height: 10.0),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Choose your Package",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold)),
                    Obx(() => Column(
                          children: [
                            CheckboxListTile(
                              title: const Text("30 Days",
                                  style: TextStyle(fontSize: 16.0)),
                              value: controller.packageDuration == "30 Days",
                              onChanged: (bool? value) {
                                controller.setPackageDuration("30 Days");
                                controller.getUpdatedPrice();
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("60 Days",
                                  style: TextStyle(fontSize: 16.0)),
                              value: controller.packageDuration == "60 Days",
                              onChanged: (bool? value) {
                                controller.setPackageDuration("60 Days");
                                controller.getUpdatedPrice();
                              },
                            ),
                          ],
                        )),
                  ],
                )),
            const SizedBox(height: 10.0),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Process Duration",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Obx(() => Column(
                          children: [
                            CheckboxListTile(
                              title: const Text("Express within 24 hours",
                                  style: TextStyle(fontSize: 16.0)),
                              value: controller.processDuration == "1",
                              onChanged: (bool? value) {
                                controller.setProcessDuration("1");
                              },
                            ),
                            CheckboxListTile(
                              title: const Text(
                                  "Regular processing time 24 to 72 hours",
                                  style: TextStyle(fontSize: 16.0)),
                              value: controller.processDuration == "2",
                              onChanged: (bool? value) {
                                controller.setProcessDuration("2");
                              },
                            ),
                          ],
                        ))
                  ],
                )),
            const SizedBox(
              height: 10.0,
            ),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Specify applicants age group',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Obx(() => Column(
                          children: [
                            CheckboxListTile(
                              title: const Text("Adult",
                                  style: TextStyle(fontSize: 16.0)),
                              value: controller.ageGroup == "1",
                              onChanged: (bool? value) {
                                controller.setAgeGroup("1");
                                controller.getUpdatedPrice();
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("Child(Below 18 years old)",
                                  style: TextStyle(fontSize: 16.0)),
                              value: controller.ageGroup == "2",
                              onChanged: (bool? value) {
                                controller.setAgeGroup("2");
                                controller.getUpdatedPrice();
                              },
                            ),
                          ],
                        ))
                  ],
                )),
            Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total  Amount",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          "AED ${model.totalFee}",
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 50.0,
                      child: ElevatedButton(
                          onPressed: () => controller.currentStep(3),
                          child: const Text("Continue")),
                    )
                  ],
                )),
          ],
        )),
      ],
    );
  }
}
