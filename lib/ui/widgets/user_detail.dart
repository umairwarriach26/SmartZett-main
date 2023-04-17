import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartzett/ui/widgets/image_picker.dart';
import '../../controllers/booking/booking_controller.dart';

class UserDetail extends GetView<BookingController> {
  const UserDetail({super.key});

  List<Step> getSteps() {
    return <Step>[
      Step(
          state: controller.subStep.value > 0
              ? StepState.complete
              : StepState.indexed,
          isActive: controller.subStep.value >= 0,
          title: const Text("Document Upload"),
          content: DocumnetForm()),
      Step(
          state: controller.subStep.value > 1
              ? StepState.complete
              : StepState.indexed,
          isActive: controller.subStep.value >= 1,
          title: const Text('Personal Detail'),
          content: UserDetailForm()),
      Step(
          state: controller.subStep.value > 2
              ? StepState.complete
              : StepState.indexed,
          isActive: controller.subStep.value >= 2,
          title: const Text('Review'),
          content: const Center(
            child: Text('Confirm'),
          )),
      Step(
          state: controller.subStep.value > 3
              ? StepState.complete
              : StepState.indexed,
          isActive: controller.subStep.value >= 3,
          title: const Text('Payment'),
          content: const PaymentForm())
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Obx(() => Stepper(
              currentStep: controller.subStep.value,
              type: StepperType.vertical,
              physics: const ClampingScrollPhysics(),
              onStepTapped: (step) {},
              onStepContinue: () {
                bool isLastStep =
                    (controller.subStep.value == getSteps().length - 1);
                if (isLastStep) {
                } else {
                  controller.subStep.value += 1;
                }
              },
              onStepCancel: () => controller.subStep.value == 0
                  ? null
                  : controller.subStep.value -= 1,
              steps: getSteps(),
            )),
      ],
    );
  }
}

class DocumnetForm extends StatelessWidget {
  DocumnetForm({super.key});
  final controller = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            const Text(
              "Make sure that all uploaded files are clear. Max file size: 9MB. Allowed file types:JPEG",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14.0),
            ),
            ListTile(
              title:
                  const Text("Profile Photo", style: TextStyle(fontSize: 16.0)),
              trailing: controller.profileImage == ""
                  ? const Icon(Icons.add)
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
              onTap: () => Get.bottomSheet(ImageMenu(type: 1)),
            ),
            ListTile(
              title: const Text("Passport Photo",
                  style: TextStyle(fontSize: 16.0)),
              trailing: controller.passportImage == ""
                  ? const Icon(
                      Icons.add,
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
              onTap: () => Get.bottomSheet(ImageMenu(type: 2)),
            ),
          ],
        ));
  }
}

class UserDetailForm extends GetView<BookingController> {
  UserDetailForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _fullName = TextEditingController();
  final _dob = TextEditingController();
  final _passportNo = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Please fill in the following personal details.",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14.0),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _fullName,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Full Name*",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Full Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _dob,
            keyboardType: TextInputType.datetime,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Date of Birth*",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Date Of Birth';
              }
              return null;
            },
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _passportNo,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Passport No*",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Passport No';
              } else if (!GetUtils.isPassport(value)) {
                return 'Enter valid Passport No';
              }
              return null;
            },
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email*",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter email';
              } else if (!GetUtils.isEmail(value)) {
                return 'Enter valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _phone,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Phone Number*",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Phone No';
              } else if (!GetUtils.isPhoneNumber(value)) {
                return 'Enter valid Phone No';
              }
              return null;
            },
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.setFullName(_fullName.text);
                  controller.setDOB(_dob.text);
                  controller.setPassportNo(_passportNo.text);
                  controller.setEmail(_email.text);
                  controller.setPhoneNo(_phone.text);
                  controller.bookVisa();
                }
              },
              child: const Text("Save"))
        ],
      ),
    );
  }
}

class PaymentForm extends StatelessWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
