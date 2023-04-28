import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/mybooking/mybooking_controller.dart';
import 'views/error_widget.dart';
import 'views/loading_widget.dart';

class MyBookindsPage extends GetView<MyBookingController> {
  const MyBookindsPage({super.key});
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "My Bookings",
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
              Expanded(
                child: controller.obx(
                    (state) => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              margin:
                                  const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
                              elevation: 8.0,
                              shadowColor: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Refrence #",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0d4e96))),
                                            Text(
                                                "${state[index].referenceName}")
                                          ],
                                        )),
                                        const Spacer(),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Status",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0d4e96))),
                                            Text(
                                                "${state[index].visaStatusName}")
                                          ],
                                        )),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Applicant",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0d4e96))),
                                            Text(
                                                "${state[index].fullEnglishName}")
                                          ],
                                        )),
                                        const Spacer(),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Phone#",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0d4e96))),
                                            Text(
                                                "${state[index].outsideUaeResidenceCountryTelephone}")
                                          ],
                                        )),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Processing Type",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0d4e96))),
                                            Text(
                                                "${state[index].processingType}")
                                          ],
                                        )),
                                        const Spacer(),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Age Group",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0d4e96))),
                                            Text("${state[index].ageGroup}")
                                          ],
                                        )),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Visa Type",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0d4e96))),
                                            Text(
                                                "${state[index].visaTypeId == "1" ? "30 Days" : "60 Days"} ${state[index].entryType} Entry")
                                          ],
                                        )),
                                        const Spacer(),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Visa Fee",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0d4e96))),
                                            Text("${state[index].totalFee}")
                                          ],
                                        )),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Passport Expiry",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0d4e96))),
                                            Text(
                                                "${state[index].passportExpiryDate}")
                                          ],
                                        )),
                                        const Spacer(),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {},
                                                child:
                                                    const Text("View Detail"))
                                          ],
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        }),
                    onLoading:
                        const LoadingWidget(message: "Loading..."), // optional
                    onError: (error) => ErrorView(
                        errorMessage: "$error",
                        onPressed: () => controller.refreshView())),
              )
            ])),
      ),
    );
  }
}
