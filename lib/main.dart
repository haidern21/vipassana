import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:vipassana/Views/BlankScreen.dart';
import 'package:vipassana/Views/splash_screen.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'controller/general_controller.dart';
//https://stackoverflow.com/a/14204067/9995125

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GeneralController());

    return const GetMaterialApp(home: BlankScreen());
  }
}
