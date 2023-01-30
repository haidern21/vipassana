import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipassana/Views/homepage.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/constants.dart';
import '../controller/general_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GeneralController controller = Get.find();
  String quote = (quotes..shuffle()).first;

  @override
  void initState() {
    super.initState();
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
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: Get.height * .35,
                    ),
                    SizedBox(
                      child: Image.asset(
                        'assets/images/meditation_image.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 15),
                      child: MyText(
                        text: quote.toUpperCase(),
                        maxLines: 5,
                        color: white,
                        weight: FontWeight.w600,
                        size: 20,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: white,
                            border: Border.all(color: black, width: 0.5),
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/google.png'),
                            const SizedBox(
                              width: 20,
                            ),
                            const MyText(
                              text: 'Sign in with Google',
                              color: black,
                              size: 18,
                              weight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => const HomePage());
                        },
                        child: const SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: Center(
                              child: MyText(
                                text: 'Skip for Now',
                                color: white,
                                size: 18,
                                weight: FontWeight.w700,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
