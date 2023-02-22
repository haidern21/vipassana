import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vipassana/controller/general_controller.dart';

import '../constants.dart';
import 'my_text.dart';

class GoogleSignInSheet extends StatelessWidget {
   GoogleSignInSheet({Key? key}) : super(key: key);
  GeneralController controller =Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Get.height * .5,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const MyText(
                text: 'Locked Advance Features',
                color: black,
                size: 18,
                weight: FontWeight.bold,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Color(0xff69BFEE),
                          shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const MyText(
                      text: 'Your own sound clip',
                      color: black,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Color(0xff69BFEE),
                          shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const MyText(
                      text: 'Leading preparation time',
                      color: black,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Color(0xff69BFEE),
                          shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const MyText(
                      text: 'Interval Time',
                      color: black,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Color(0xff69BFEE),
                          shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const MyText(
                      text: 'Meditation Log',
                      color: black,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const MyText(
                text: 'Unlock all features for free',
                color: black,
                size: 18,
                weight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              const MyText(
                text:
                'Sign-in with Google to unlock features. In respect of privacy and security, the App does not collect login data, Google takes care of the process',
                color: black,
                size: 14,
                weight: FontWeight.normal,
                textAlign: TextAlign.justify,
                maxLines: 5,
              ),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0,),
                child: InkWell(
                  onTap: () async {
                    if( controller.isUserLoggedIn.value==false){

                      await controller.handleSignIn();
                    }
                   // await controller.checkIfSignedIn();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: selectedBorderColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg_assets/google.svg'),
                        const SizedBox(
                          width: 20,
                        ),
                        const MyText(
                          text: 'Sign in with Google',
                          color: selectedBorderColor,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //   onTap: () async {
              //     await controller.handleSignOut();
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: selectedBorderColor)),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Image.asset('assets/images/google.png'),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //         const MyText(
              //           text: 'Sign out with Google',
              //           color: selectedBorderColor,
              //           size: 16,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
