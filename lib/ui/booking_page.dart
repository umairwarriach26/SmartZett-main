import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartzett/ui/widgets/loading_widget.dart';
import 'package:smartzett/ui/widgets/package_detail.dart';
import 'package:smartzett/ui/widgets/package_selection.dart';
import 'package:smartzett/ui/widgets/user_detail.dart';
import '../controllers/booking/booking_controller.dart';
import 'widgets/documnet_upload.dart';
import 'widgets/error_widget.dart';
import 'widgets/nationality_selection.dart';
import 'widgets/payment_form.dart';
import 'widgets/review_form.dart';

class BookingPage extends GetView<BookingController> {
  const BookingPage({super.key});
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
                      "UAE Tourist Visa",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(color: Color(0xff808285), fontSize: 25.0),
                    ),
                    Obx(() => controller.currentStep.value > 0
                        ? TextButton(
                            child: const Text("< Back",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0d4e96))),
                            onPressed: () => controller
                                .goToForm(controller.currentStep.value - 1),
                          )
                        : IconButton(
                            icon: const Icon(Icons.cancel_outlined,
                                color: Color(0xff0d4e96)),
                            onPressed: () => Get.back(),
                          )),
                  ],
                ),
              ),
              Expanded(
                child: controller.obx(
                    (state) => Obx(() {
                          switch (controller.currentStep.value) {
                            case 0:
                              return const NationalityForm();
                            case 1:
                              return const PackageSelection();
                            case 2:
                              return PackageDetail(model: state!);
                            case 3:
                              return const DocumnetUploadForm();
                            case 4:
                              return UserDetailForm();
                            case 5:
                              return const ReviewForm();
                            case 6:
                              return const PaymentForm();
                            default:
                              return Container();
                          }
                        }),
                    onLoading: const LoadingWidget(message: "Processing..."),
                    onError: (error) => ErrorView(
                        errorMessage: "$error",
                        onPressed: () => controller.refreshView())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
