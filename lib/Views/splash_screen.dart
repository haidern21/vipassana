import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipassana/Views/homepage.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    moveToNextPage();
    super.initState();
  }

  moveToNextPage() {
    Future.delayed(
        const Duration(seconds: 0), () => Get.to(() => const HomePage()));
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
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: MyText(
                text:
                    'Self observation is the first \n step in inner unfolding',
                maxLines: 2,
                color: white,
                weight: FontWeight.w400,
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
