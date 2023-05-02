import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:smartzett/controllers/auth/auth_controller.dart";

import "../widgets/error_widget.dart";
import "../widgets/loading_widget.dart";

class SignupPage extends GetView<AuthController> {
  SignupPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _consfirmPasswordController = TextEditingController();

  Future<bool> _onPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: controller.obx(
            (state) => SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: ListView(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            scale: 3,
                          ),
                          const SizedBox(height: 50.0),
                          TextFormField(
                            controller: _firstNameController,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                labelText: "First Name",
                                hintText: "Enter First Name"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter First Name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: _lastNameController,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                labelText: "Last Name",
                                hintText: "Enter Last Name"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Last Name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                labelText: "Email", hintText: "Enter Email"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter email";
                              } else if (!GetUtils.isEmail(value)) {
                                return "Enter valid email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: _phoneController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                labelText: "Phone No",
                                hintText: "+971 12345678"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Phone No";
                              } else if (!GetUtils.isPhoneNumber(value)) {
                                return "Enter Valid Phone No";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          Obx(() => Column(
                                children: [
                                  TextFormField(
                                    controller: _passwordController,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.text,
                                    obscureText: controller.showPassword,
                                    decoration: const InputDecoration(
                                        labelText: "Password",
                                        hintText: "Enter Password"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter password";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                  TextFormField(
                                    controller: _consfirmPasswordController,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.text,
                                    obscureText: controller.showPassword,
                                    decoration: const InputDecoration(
                                        labelText: "Confirm Password",
                                        hintText: "Enter Confirm Password"),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Confirm Confirm";
                                      } else if (value !=
                                          _passwordController.text) {
                                        return "Passwords dont match";
                                      }
                                      return null;
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          child: Text(
                                            controller.showPassword
                                                ? "(Show)"
                                                : "(Hide)",
                                            style: const TextStyle(
                                              color: Color(0xffed1c24),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            controller.showPassword
                                                ? controller.obscured(false)
                                                : controller.obscured(true);
                                          }),
                                    ],
                                  ),
                                ],
                              )),
                          const SizedBox(height: 10.0),
                          SizedBox(
                              height: 50.0,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      controller.signup(
                                          _firstNameController.text,
                                          _lastNameController.text,
                                          _emailController.text,
                                          _phoneController.text,
                                          _passwordController.text);
                                    }
                                  },
                                  child: const Text("SignUp"))),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have account?"),
                              TextButton(
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Color(0xffed1c24),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () => Get.back(),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            onLoading: const LoadingWidget(message: "Processing..."),
            onError: (error) => ErrorView(
                errorMessage: "$error",
                onPressed: () => controller.refreshView())),
      ),
    );
  }
}
