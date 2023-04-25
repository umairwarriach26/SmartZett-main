import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartzett/ui/widgets/error_widget.dart';
import '../controllers/auth/auth_controller.dart';
import 'widgets/loading_widget.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            scale: 3,
                          ),
                          const SizedBox(height: 35.0),
                          TextFormField(
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                labelText: "Email", hintText: 'Enter Email'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter email';
                              } else if (!GetUtils.isEmail(value)) {
                                return 'Enter valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: _passwordController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: "Password",
                                hintText: 'Enter Password'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter password';
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
                                      controller.login(_emailController.text,
                                          _passwordController.text);
                                    }
                                  },
                                  child: const Text("Login"))),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have account?"),
                              TextButton(
                                child: const Text(
                                  "Signup",
                                  style: TextStyle(
                                    color: Color(0xffed1c24),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () => Get.toNamed("/signup"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            onLoading: const LoadingWidget(message: "Verifying..."),
            onError: (error) => ErrorView(
                errorMessage: "$error",
                onPressed: () => controller.refreshView())),
      ),
    );
  }
}
