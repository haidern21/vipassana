import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vipassana/Views/BlankScreen.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'controller/general_controller.dart';
//sudo gem install cocoapods --user-install
//export GEM_HOME=$HOME/.gem
// export PATH=$GEM_HOME/bin:$PATH
// gem install cocoapods --user-install
//https://stackoverflow.com/a/14204067/9995125

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GeneralController());

    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
      return const GetMaterialApp(home: BlankScreen());
    });
  }
}
