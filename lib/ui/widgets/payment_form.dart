import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/booking/booking_controller.dart';

class PaymentForm extends GetView<BookingController> {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        const Text(
          "Please Review the below payment information",
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 14.0),
        ),
        ListTile(
          title: const Text("UAE"),
          subtitle: Text(
              "${controller.packageDuration == "1" ? "30 Days" : "60 Days"} ${controller.package.toString().toUpperCase()} Entry Visa"),
        ),
        ListTile(
          title: const Text("Visa Fee"),
          subtitle: const Text("Visa fee excluding VAT"),
          trailing: Text("AED ${controller.visaFee}"),
        ),
        ListTile(
          title: const Text("Processing Fee"),
          subtitle: const Text("Visa Processing fee"),
          trailing: Text("AED ${controller.processingFee}"),
        ),
        ListTile(
          title: const Text("Processing Fee VAT"),
          subtitle: const Text("Visa Processing Fee VAT"),
          trailing: Text("AED ${controller.processingFeeVat}"),
        ),
        ListTile(
          title: const Text("Grand Total"),
          subtitle: const Text("Total Amount AED"),
          trailing: Text("AED ${controller.processingFeeVat}"),
        ),
        SizedBox(
          height: 50.0,
          child: ElevatedButton(
              onPressed: () => _doPayment(), child: const Text("Pay")),
        )
      ],
    );
  }

  Future<void> _doPayment() async {
    try {
      Uri httpsUri = Uri(
          scheme: 'https',
          host: 'secure.telr.com',
          path: 'https://secure.telr.com/gateway/order.json',
          queryParameters: {
            'ivp_method': 'create',
            'ivp_store': '18140',
            "ivp_authkey": "TELR_PAYMENT_KEY",
            "ivp_amount": "1",
            "ivp_currency": "AED",
            "ivp_test": "0",
            "ivp_cart": "1234",
          });

      await launchUrl(
        httpsUri,
        mode: LaunchMode.inAppWebView,
      );
    } on PlatformException catch (e) {
      Get.snackbar("Error", "${e.message}");
    }
  }
}
