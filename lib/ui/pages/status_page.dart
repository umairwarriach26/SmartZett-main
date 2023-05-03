import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smartzett/controllers/status/status_controller.dart';

import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/nodata_widget.dart';

class StatusPage extends GetView<StatusController> {
  StatusPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _searchStatusController = TextEditingController();
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
                children: const [
                  Text(
                    "Visa Status",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xff808285), fontSize: 25.0),
                  ),
                  SizedBox()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _searchStatusController,
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {
                          if (_formKey.currentState!.validate()) {
                            controller
                                .getVisaStatus(_searchStatusController.text);
                          }
                        },
                        decoration: const InputDecoration(
                            labelText:
                                "Search Visa Status by (Refrence Number)",
                            hintText:
                                "Search Visa Status by (Refrence Number)"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Refence Number";
                          }
                          return null;
                        },
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller
                                .getVisaStatus(_searchStatusController.text);
                          }
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
              ),
            ),
            controller.obx(
                (state) => controller.model.referenceNo == null
                    ? const SizedBox()
                    : Card(
                        margin: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
                        elevation: 8.0,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Refrence #",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff0d4e96))),
                                      Text("${controller.model.referenceName}")
                                    ],
                                  )),
                                  const Spacer(),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Status",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff0d4e96))),
                                      Text("${controller.model.visaStatusName}")
                                    ],
                                  )),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Passport No #",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff0d4e96))),
                                      Text("${controller.model.passportNumber}")
                                    ],
                                  )),
                                  const Spacer(),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Passport Expiry",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff0d4e96))),
                                      Text(
                                          "${controller.model.passportExpiryDate}")
                                    ],
                                  )),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Entry Type",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff0d4e96))),
                                      Text(controller.model.visaTypeId == "1"
                                          ? "Single Entry"
                                          : "Multi Entry")
                                    ],
                                  )),
                                  const Spacer(),
                                  const SizedBox()
                                ],
                              ),
                            ],
                          ),
                        )),
                onLoading:
                    const LoadingWidget(message: "Loading..."), // optional
                onError: (error) => ErrorView(
                    errorMessage: "$error",
                    onPressed: () => controller.refreshView()),
                onEmpty: const NoDataWidget(errorMessage: "No record found"))
          ],
        )),
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.dashboard, color: Color(0xff808285)),
                    onPressed: () => Get.offAndToNamed("/home"),
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.passport,
                        color: Color(0xff808285)),
                    onPressed: () => Get.toNamed("/booking"),
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.checkDouble,
                        color: Color(0xff0d4e96)),
                    onPressed: () {},
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
