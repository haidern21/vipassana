import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipassana/Views/splash_screen.dart';

import 'controller/general_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GeneralController());

    return const GetMaterialApp(

        home: SplashScreen());
  }
}
