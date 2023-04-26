import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/constants.dart';

import 'in_app_purchase.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back_ios_new,
                            color: black, size: 18)),
                    SizedBox(
                      width: Get.width * .25,
                    ),
                    Center(
                      child: MyText(
                        text: 'Support',
                        weight: FontWeight.bold,
                        size: 22.sp,
                        color: black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // Container(
                //   height:Get.width * .6,
                //   width: Get.width * .6,
                //   decoration: const BoxDecoration(
                //       shape: BoxShape.circle,
                //       image: DecorationImage(
                //           image: AssetImage('assets/images/me.jpg',))),
                // ),
                CircleAvatar(
                    radius: Get.width * .35,
                    backgroundImage: const AssetImage(
                      'assets/images/me.jpg',
                    )),
                const SizedBox(
                  height: 20,
                ),
                MyText(
                  text: 'Andrea, the App developer',
                  size: 18.sp,
                  weight: FontWeight.bold,
                  color: black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: black.withOpacity(0.3),
                ),
                MyText(
                  text:
                      'Dear Meditator,\n\nI am writing to request a donation for our free app. Our app has been developed to provide valuable meditation services to users around the world, free of charge. We are dedicated to making a positive impact on society and believe that our meditation app can make a difference in people\'s lives.\n\nHowever, maintaining and improving our app requires significant resources. As a non-profit project, we rely on the generosity of donors like you to continue offering our services to the public. Your donation would help us cover the costs of hosting, development, and maintenance, and ensure that our app remains free and accessible to all.\n\nWe would be grateful for any amount you can contribute, and we promise to use it wisely to continue delivering quality services to our users. Thank you in advance for your support.\n\nBlessings,\n\n~ Derek',
                  color: black,
                  size: 16.sp,
                  textAlign: TextAlign.justify,
                  maxLines: 30,
                ),
                SizedBox(
                  height: 70.h,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                              height: Get.height * .3,
                              child: inApp(),
                            ));
                    // showCupertinoModalBottomSheet(
                    //     expand: false,
                    //     context: context,
                    //     backgroundColor: Colors.transparent,
                    //     builder: (context) =>
                    //         SizedBox(height: Get.height * .3, child: inApp()));
                  },
                  child: Container(
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
                        Image.asset(
                          'assets/images/support.png',
                          fit: BoxFit.cover,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        MyText(
                          text: 'Buy me a Coffee',
                          color: black,
                          size: 18.sp,
                          weight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
