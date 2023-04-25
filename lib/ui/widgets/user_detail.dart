import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/booking/booking_controller.dart';

// class UserDetail extends GetView<BookingController> {
//   const UserDetail({super.key});

//   List<Step> getSteps() {
//     return <Step>[
//       Step(
//           state: controller.subStep.value > 0
//               ? StepState.complete
//               : StepState.indexed,
//           isActive: controller.subStep.value >= 0,
//           title: const Text("Document Upload"),
//           content: DocumnetForm()),
//       Step(
//           state: controller.subStep.value > 1
//               ? StepState.complete
//               : StepState.indexed,
//           isActive: controller.subStep.value >= 1,
//           title: const Text('Personal Detail'),
//           content: UserDetailForm()),
//       Step(
//           state: controller.subStep.value > 2
//               ? StepState.complete
//               : StepState.indexed,
//           isActive: controller.subStep.value >= 2,
//           title: const Text('Review'),
//           content: const Center(
//             child: Text('Confirm'),
//           )),
//       Step(
//           state: controller.subStep.value > 3
//               ? StepState.complete
//               : StepState.indexed,
//           isActive: controller.subStep.value >= 3,
//           title: const Text('Payment'),
//           content: const PaymentForm())
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Obx(() => Stepper(
//               currentStep: controller.subStep.value,
//               type: StepperType.vertical,
//               physics: const ClampingScrollPhysics(),
//               onStepTapped: (step) {},
//               onStepContinue: () {
//                 bool isLastStep =
//                     (controller.subStep.value == getSteps().length - 1);
//                 if (isLastStep) {
//                 } else {
//                   controller.subStep.value += 1;
//                 }
//               },
//               onStepCancel: () => controller.subStep.value == 0
//                   ? null
//                   : controller.subStep.value -= 1,
//               steps: getSteps(),
//             )),
//       ],
//     );
//   }
// }

class UserDetailForm extends GetView<BookingController> {
  UserDetailForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _fullName = TextEditingController();
  final _dob = TextEditingController();
  final _passportNo = TextEditingController();
  final _passportExpiry = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _setFormValues();
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const Text(
            "Please fill in the following personal details.",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14.0),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _fullName,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: "Full Name*",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Full Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _dob,
            keyboardType: TextInputType.datetime,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "Date of Birth*",
            ),
            readOnly: true,
            showCursor: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Select Date Of Birth';
              }
              return null;
            },
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              _chooseDOB();
            },
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _passportNo,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.characters,
            decoration: const InputDecoration(
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
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _passportExpiry,
            keyboardType: TextInputType.datetime,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "Passport Expiry*",
            ),
            readOnly: true,
            showCursor: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Select Passport Expiry';
              }
              return null;
            },
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              _chooseExpiry();
            },
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
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
          const SizedBox(height: 10.0),
          SizedBox(
            height: 50.0,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.setFullName(_fullName.text);
                    controller.setDOB(_dob.text);
                    controller.setPassportNo(_passportNo.text);
                    controller.setPassportExpiry(_passportExpiry.text);
                    controller.setEmail(_email.text);
                    controller.setPhoneNo(_phone.text);
                    //controller.bookVisa();
                    controller.currentStep(5);
                  }
                },
                child: const Text("Continue")),
          )
        ],
      ),
    );
  }

  _setFormValues() {
    _fullName.text = controller.fullName;
    _email.text = controller.email;
    _dob.text = controller.dob;
    _passportNo.text = controller.passportNo;
    _passportExpiry.text = controller.passportExpiry;
    _phone.text = controller.phoneNo;
  }

  _chooseDOB() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      //initialEntryMode: DatePickerEntryMode.input,
      //initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Year/Month/day',
      //selectableDayPredicate: disableDate
    );
    if (pickedDate != null) {
      _dob.text = DateFormat("yyyy-MM-dd").format(pickedDate).toString();
    }
  }

  _chooseExpiry() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      //initialEntryMode: DatePickerEntryMode.input,
      //initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Expiry',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Year/Month/day',
      //selectableDayPredicate: disableDate
    );
    if (pickedDate != null) {
      _passportExpiry.text =
          DateFormat("yyyy-MM-dd").format(pickedDate).toString();
    }
  }
  // bool disableDate(DateTime day) {
  //   if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
  //       day.isBefore(DateTime.now().add(const Duration(days: 5))))) {
  //     return true;
  //   }
  //   return false;
  // }
}
