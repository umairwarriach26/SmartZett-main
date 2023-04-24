import 'package:flutter/material.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: const [
        Text(
          "Please Review the below payment information",
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 14.0),
        ),
        ListTile(
          title: Text("UAE"),
          subtitle: Text("60 Day Tourist Visa"),
          trailing: Text("AED 800"),
        ),
        ListTile(
          title: Text("VAT(5%)"),
          subtitle: Text("Total Amount AED 840"),
          trailing: Text("AED 40"),
        ),
      ],
    );
  }
}
