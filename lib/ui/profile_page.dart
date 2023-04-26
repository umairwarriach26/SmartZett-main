import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../services/local_storage.dart';

class ProfilePage extends GetView<LocalStorageService> {
  ProfilePage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _dob = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();

  Future<bool> _onPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    _setFormValues();
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Profile",
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
                    child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: [
                    const Icon(Icons.person,
                        size: 100, color: Color(0xff0d4e96)),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: _firstName,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: "First Name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter First Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: _lastName,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: "Last Name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Last Name';
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
                        labelText: "Date of Birth",
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
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Email",
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
                        labelText: "Phone Number",
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
                            if (_formKey.currentState!.validate()) {}
                          },
                          child: const Text("Save")),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _setFormValues() {
    _firstName.text = controller.user!.firstName ?? "";
    _lastName.text = controller.user!.lastName ?? "";
    _email.text = controller.user!.email ?? "";
    _phone.text = controller.user!.phone ?? "";
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
}
