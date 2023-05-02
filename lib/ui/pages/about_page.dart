import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  Future<bool> _onPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "About Us",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(color: Color(0xff808285), fontSize: 25.0),
                    ),
                    TextButton(
                      child: const Text("< Back",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0d4e96))),
                      onPressed: () => Get.back(),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ListTile(
                        //leading: Icon(Icons.info),
                        title: Text(
                          "Smart Travel is a full service travel agency dedicated to providing corporate, leisure and retail travel service. Smart Travel LLC is just not travel agnecy, we help you weave your travel dreams. Smart Travel as an entity takes care or any tour and travel requirements of its esteemed clients.",
                          style: TextStyle(color: Color(0xff0d4e96)),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text(
                          "Smart Travel LLC - Al Mina Road, Sharjah - UAE P.O BOX 72088",
                          style: TextStyle(color: Color(0xff0d4e96)),
                        ),
                        subtitle: SelectableText(
                          "TEL: +971 65 691 111",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text(
                          "Smart Travel - Abu Hail Dubai UAE",
                          style: TextStyle(color: Color(0xff0d4e96)),
                        ),
                        subtitle: SelectableText(
                          "TEL: +971 42 737 777",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text(
                          "Smart Travel - Payannur Kerala India P.O 670307",
                          style: TextStyle(color: Color(0xff0d4e96)),
                        ),
                        subtitle: SelectableText(
                          "TEL: +91 498 521 7911",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
