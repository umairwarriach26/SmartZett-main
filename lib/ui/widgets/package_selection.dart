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
                value: controller.package == "single",
                onChanged: (bool? value) {
                  controller.setPackage("single");
                  //controller.getUpdatedPrice();
                  //controller.currentStep(2);
                },
              ),
              CheckboxListTile(
                title:
                    const Text("Multi Entry", style: TextStyle(fontSize: 16.0)),
                value: controller.package == "multi",
                onChanged: (bool? value) {
                  controller.setPackage("multi");
                  //controller.currentStep(2);
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.0,
          child: ElevatedButton(
              onPressed: () => controller.getUpdatedPrice(),
              child: const Text("Continue")),
        ),
        const SizedBox(height: 10.0),
        const Text(
          "Requirements for UAE Visa",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        const Text(
          "Visitors must be out of the UAE While applying for a UAE visa. Extension of 30 days for current visa is only possible if last visa was applied through Musafir.com",
          style: TextStyle(fontSize: 14.0),
        ),
        const SizedBox(height: 20.0),
        const ListTile(
          leading: Icon(
            Icons.document_scanner,
            color: Color(0xff0d4e96),
          ),
          title: Text("Documents",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          subtitle: Text(
              "A copy of each visitor's passport's first and last pages.Each visitor's passport should have a minimum validity of 6 months.",
              style: TextStyle(fontSize: 14.0)),
        ),
        const ListTile(
          leading: Icon(
            Icons.photo_camera_sharp,
            color: Color(0xff0d4e96),
          ),
          title: Text("Photo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          subtitle: Text(
              "Each visitor's passport size photogragh taken against a white background.",
              style: TextStyle(fontSize: 14.0)),
        ),
        const ListTile(
          leading: Icon(
            Icons.people_alt,
            color: Color(0xff0d4e96),
          ),
          title: Text("Relatonship",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          subtitle: Text(
              "If the visitor is your spouse, the same must be mentioned on your passport.",
              style: TextStyle(fontSize: 14.0)),
        ),
        const ListTile(
          leading: Icon(
            Icons.wallet,
            color: Color(0xff0d4e96),
          ),
          title: Text("Cash Deposit",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          subtitle: Text(
              "Additional cash deposit of up to AED 1000 may be required for certain visitors(not applicable for family visas*).",
              style: TextStyle(fontSize: 14.0)),
        ),
      ],
    );
  }
}
