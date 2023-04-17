import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/local_storage.dart';
import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

initServices() async {
  await Get.putAsync(() => LocalStorageService().init());
}
