import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smartzett/controllers/booking/booking_controller.dart';

class EditVisaForm extends GetView<BookingController> {
  EditVisaForm({super.key});
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
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const Text(
            "Edit Information",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14.0),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _fullName,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
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
              _chooseDate();
            },
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _passportNo,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.characters,
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
          TextFormField(
            controller: _dob,
            keyboardType: TextInputType.datetime,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
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
              _chooseDate();
            },
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 50.0,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.setFullName(_fullName.text);
                    controller.setDOB(_dob.text);
                    controller.setPassportNo(_passportNo.text);
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

  _chooseDate() async {
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
}
