import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipassana/Views/homepage.dart';
import 'package:vipassana/Views/login_page.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/constants.dart';

import '../controller/general_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GeneralController controller = Get.find();
  String quote = (quotes..shuffle()).first;

  @override
  void initState() {

    controller.checkIfSignedIn();

    moveToNextPage();
    super.initState();
  }

  moveToNextPage() {
    Future.delayed(

        const Duration(seconds: 3), () {
      controller.isUserLoggedIn.value==false?
          Get.offAll(() => const LoginScreen()):Get.offAll(() => const HomePage());
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Image.asset(
              'assets/images/background_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/meditation_image.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60.0,horizontal: 15),
              child: MyText(
                text: quote.toUpperCase(),
                maxLines: 5,
                color: white,
                weight: FontWeight.w600,
                size: 23,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
