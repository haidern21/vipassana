import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
                const Center(
                  child: MyText(
                    text: 'Support',
                    weight: FontWeight.bold,
                    size: 22,
                    color: black,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: Get.height * .30,
                  width: Get.width * .6,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/me.jpg'))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const MyText(
                  text: 'Andrea, the App developer',
                  size: 18,
                  weight: FontWeight.bold,
                  color: black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: black.withOpacity(0.3),
                ),
                const MyText(
                  text:
                      'Hi there, you might remember me from the initial intro of App. I am the app developer, I take care of maintenance, bug fixes as well as working on the app updates, I am the one to blame for when things gone wrong :-) i alos write the blog, manage the mailing list, meditate as much as I can. \n\nSince the Vipassana Meditation Timer App launch in 2015, our community has grown from a few individual to hundreds of meditators. Seven years have gone by and i want to keep on working on the app as well as continue to keep the App free of charge and free of advertisments, I am therefore asking for a little help. \n\nMeditators wanting to practice giving, can now buy me a cup of coffee directly from the App. If you feel like contributing, I will and we will all very much appreciate. Thank you :-)',
                  color: black,
                  size: 16,
                  textAlign: TextAlign.justify,
                  maxLines: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    showCupertinoModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) =>
                            SizedBox(
                                height: Get.height * .3,
                                child: inApp())
                    );
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
                        Image.asset('assets/images/support.png',fit: BoxFit.cover,height: 20,width: 20,),
                        const SizedBox(
                          width: 20,
                        ),
                        const MyText(
                          text: 'Buy me a Coffee',
                          color: black,
                          size: 18,
                          weight: FontWeight.w500,
                        )
                      ],
                    ),

                  ),
                ),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
