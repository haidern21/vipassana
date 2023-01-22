import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/controller/general_controller.dart';
import '../constants.dart';

class HelpAndMore extends StatefulWidget {
  const HelpAndMore({Key? key}) : super(key: key);

  @override
  State<HelpAndMore> createState() => _HelpAndMoreState();
}

class _HelpAndMoreState extends State<HelpAndMore> {
  GeneralController controller=Get.find();
  List<HelpTileModel> helpTiles = [
    HelpTileModel(
        imagePath: 'assets/images/feedback.png', text: 'Your feedback counts'),
    HelpTileModel(imagePath: 'assets/images/star.png', text: 'Rate the app'),
    HelpTileModel(
        imagePath: 'assets/images/introduction.png', text: 'App Introduction'),
    HelpTileModel(imagePath: 'assets/images/support.png', text: 'Support'),
    HelpTileModel(
        imagePath: 'assets/images/share.png', text: 'Share with friends'),
    HelpTileModel(
        imagePath: 'assets/images/mail.png', text: 'Join the mailing list'),
    HelpTileModel(
        imagePath: 'assets/images/facebook.png', text: 'Facebook page'),
    HelpTileModel(
        imagePath: 'assets/images/learn_more.png', text: 'Learn more about us'),
    HelpTileModel(
        imagePath: 'assets/images/lock.png', text: 'Advance Features'),
    HelpTileModel(imagePath: 'assets/images/faq.png', text: 'FAQs'),
    HelpTileModel(imagePath: 'assets/images/logs_image.png', text: 'Blog'),
    HelpTileModel(
        imagePath: 'assets/images/privacy.png',
        text: 'Privacy and Terms of service'),
  ];
  List<GestureTapCallback> onTaps = [];

  @override
  void initState() {
    onTaps = [
      /// index 0
      () => yourFeedBack(),

      /// index 1
      () => rateTheApp(),

      /// index 2
      () => appIntroduction(),

      /// index 3
      () => support(),

      /// index 4
      () => shareWithFriends(),

      /// index 5
      () => joinMailingList(),

      /// index 6
      () => facebookPage(),

      /// index 7
      () => learnMoreAboutUs(),

      /// index 8
      () => advanceFeature(),

      /// index 9
      () => faqs(),

      /// index 10
      () => blog(),

      /// index 11
      () => privacyAnTermOfService(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: MyText(
                text: 'Help and More',
                color: black,
                size: 18,
                weight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => helpTile(
                      imagePath: helpTiles[index].imagePath,
                      onTap: onTaps[index],
                      text: helpTiles[index].text),
                  separatorBuilder: (context, index) => Column(
                        children: const [
                          Divider(
                            color: dividerColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                  itemCount: helpTiles.length),
            )
          ],
        ),
      ),
    );
  }

  Widget helpTile(
      {required String imagePath,
      required String text,
      required GestureTapCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Row(
          children: [
            Image.asset(
              imagePath,
            ),
            const SizedBox(
              width: 20,
            ),
            MyText(
              text: text,
              color: black,
              size: 15,
              weight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }

  void yourFeedBack() {}

  void rateTheApp() {}

  void appIntroduction() {}

  void support() {}

  void shareWithFriends() {}

  void joinMailingList() {}

  void facebookPage() {}

  void learnMoreAboutUs() {}

  void advanceFeature() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        builder: (context) {

          return SingleChildScrollView(
            child: SizedBox(
              height: Get.height * .6,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        //await controller.checkIfSignedIn();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: selectedBorderColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/google.png'),
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
        });
  }

  void faqs() {}

  void blog() {}

  void privacyAnTermOfService() {}
}

class HelpTileModel {
  String imagePath;
  String text;

  HelpTileModel({required this.imagePath, required this.text});
}
