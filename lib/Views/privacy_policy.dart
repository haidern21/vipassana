import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipassana/Widgets/my_text.dart';

import '../constants.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Column(
              children:  [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap:()=> Get.back(),
                        child: const Icon(Icons.arrow_back_ios_new,color: black,size:18)),
                    const SizedBox(width: 20,),
                    const Expanded(
                      child: MyText(
                        text: 'Privacy Policy & Terms of services',
                        color: black,
                        weight: FontWeight.bold,
                        size: 18,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const MyText(
                  text:
                      'Vipassanā Meditation Timer, in short VMT, is a commercial application built for the Android platform for the use of Vipassanā meditators and alike.',
                  size: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                  color: black,
                  maxLines: 10,
                ),
                const MyText(
                  text:
                      'VMT is distributed for FREE on various platforms like GOOGLE PLAY, AMAZON and so forth.',
                  size: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                  color: black,
                  maxLines: 10,
                ),
                const MyText(
                  text:
                      'In order to raise funds for maintainance, VMT implements advertising in the form of banners, respecting the regulations of Google Play Distribution platform.',
                  size: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                  color: black,
                  maxLines: 10,
                ),
                const MyText(
                  text:
                      'VMT is a work in progress application, it will present a few little bugs that we will fix as required, within our time frame and capabilities. Updates to the app will come regularly, but not at fixed dates.',
                  size: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                  color: black,
                  maxLines: 10,
                ),
                const MyText(
                  text:
                      'VMT does collect meditation data from the Remote Meditation Log. The data is anonymously stored and cannot be related to any particular user.',
                  size: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                  color: black,
                  maxLines: 10,
                ),
                const MyText(
                  text:
                      'We cannot take responsibility for problems related to your device and the particular way your device interact with the VMT application. Also, uninstall of the app will erase local data, in the form of meditation data; we will not be held responsible for restoring your data.',
                  size: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                  color: black,
                  maxLines: 10,
                ),
                const MyText(
                  text:
                      'We do not take on responsibility for data loss that might occur due to events that are out of our control. (ie. Database damage, corruption, Android platform problems)',
                  size: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                  color: black,
                  maxLines: 10,
                ),
                const MyText(
                  text:
                      'Login to Google will create a reference between VMT and Google Service, no sensitive data is collected from the user (i.e. Email Address, Location and so forth).',
                  size: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                  color: black,
                  maxLines: 10,
                ),
                const MyText(
                  text:
                      'For any enquiries and suggestions please contact us on Facebook or via the website.',
                  size: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                  color: black,
                  maxLines: 10,
                ),
                const MyText(
                  text:
                      'We really appreciate you choosing our app, we will make the most to make it work on most platforms and we wish you all a life without suffering.',
                  size: 16,
                  weight: FontWeight.w400,
                  textAlign: TextAlign.justify,
                  color: black,
                  maxLines: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
