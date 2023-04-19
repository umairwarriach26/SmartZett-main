import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartzett/controllers/status/status_controller.dart';
import 'package:smartzett/ui/widgets/error_widget.dart';
import 'package:smartzett/ui/widgets/loading_widget.dart';
import 'package:ticket_widget/ticket_widget.dart';

class StatusPage extends GetView<StatusController> {
  const StatusPage({super.key});

  Future<bool> _onPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: controller.obx(
              (state) => Column(
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
                                "Visa Status",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xff808285), fontSize: 25.0),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.filter_alt_outlined,
                                      color: Color(0xff0d4e96)))
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: state!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TicketWidget(
                                    width: 350,
                                    height: 300,
                                    isCornerRounded: true,
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 30.0, 20.0, 30.0),
                                    margin: const EdgeInsets.all(4.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const Text(
                                              "Refrence #",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                  color: Colors.red),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "${state[index].referenceName}",
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black),
                                              textAlign: TextAlign.start,
                                            ),
                                            const SizedBox(height: 10.0),
                                            const Text(
                                              "Visa Applicant",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                  color: Colors.red),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "${state[index].fullEnglishName}",
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black),
                                              textAlign: TextAlign.start,
                                            ),
                                            const SizedBox(height: 10.0),
                                            const Text(
                                              "Phone #",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                  color: Colors.red),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "${state[index].outsideUaeResidenceCountryTelephone}",
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        )),
                                        const SizedBox(width: 12.0),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const Text(
                                              "Status",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.red),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "${state[index].visaStatusName}",
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black),
                                              textAlign: TextAlign.start,
                                            ),
                                            const SizedBox(height: 10.0),
                                            const Text(
                                              "Type",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.red),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "30 Days ${state[index].visaTypeId == "1" ? "Single Entry" : "Multi Entry"}",
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black),
                                              textAlign: TextAlign.start,
                                            ),
                                            const SizedBox(height: 10.0),
                                            const Text(
                                              "Date Of Birth",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Colors.red),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "${state[index].dateOfBirth}",
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        )),
                                      ],
                                    ));
                              }),
                        )
                      ]),
              onLoading: const LoadingWidget(message: "Loading..."), // optional
              onError: (error) => ErrorView(
                  errorMessage: "$error",
                  onPressed: () => controller.refreshView())),
        ),
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined,
                        color: Color(0xff808285)),
                    onPressed: () => Get.offAndToNamed("/home"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.playlist_add_outlined,
                        color: Color(0xff808285)),
                    onPressed: () => Get.toNamed("/booking"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.mobile_friendly,
                        color: Color(0xff0d4e96)),
                    onPressed: () {},
                  ),
                ],
              ),
            )),
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: const Color(0xff0d4e96),
        //     child: const Icon(Icons.dashboard_customize),
        //     onPressed: () => Get.toNamed("/booking")),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
