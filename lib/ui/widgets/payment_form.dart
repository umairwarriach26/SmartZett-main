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
              "${controller.packageDurationCoverted} (${controller.packageCapital} Entry Visa)"),
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
          trailing: Text("AED ${controller.totalFee}"),
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
            'ivp_method': 'check',
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

  // Future<void> _doPayment() async {
  //   String message;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   // We also handle the message potentially returning null.
  //   try {
  //     message = await TelrPaymentGateway.callTelRForTransaction(
  //           store_id: "25798",
  //           key: "Nbsw5^mDR5@3m9Nc",
  //           amount: "20",
  //           app_install_id: "123456",
  //           app_name: "TelR",
  //           app_user_id: "12345",
  //           app_version: "1.0.0",
  //           sdk_version: "123",
  //           mode: "1",
  //           tran_type: "sale",
  //           tran_cart_id: "1003",
  //           desc: "First Transaction",
  //           tran_lang: "EN",
  //           tran_currency: "AED",
  //           bill_city: "Dubai",
  //           bill_country: "AE",
  //           bill_region: "Dubai",
  //           bill_address: "SIT GTower",
  //           bill_first_name: "Deep",
  //           bill_last_name: "Amin",
  //           bill_title: "Mr",
  //           bill_email: "deep@innovuratech.com",
  //           bill_phone: "528636596",
  //         ) ??
  //         'Unknown Message';
  //   } on PlatformException {
  //     message = 'Failed to get Message.';
  //   }
  //   print("Clicked Message == $message");
  // }
}
