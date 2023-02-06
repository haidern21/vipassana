import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vipassana/Views/feedback.dart';
import 'package:vipassana/Views/join_mailing_list.dart';
import 'package:vipassana/Views/privacy_policy.dart';
import 'package:vipassana/Views/support.dart';
import 'package:vipassana/Widgets/google_signin_sheet.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/controller/general_controller.dart';
import '../constants.dart';
import 'package:share_plus/share_plus.dart';

import 'in_app_purchase.dart';

class HelpAndMore extends StatefulWidget {
  const HelpAndMore({Key? key}) : super(key: key);

  @override
  State<HelpAndMore> createState() => _HelpAndMoreState();
}

class _HelpAndMoreState extends State<HelpAndMore> {
  GeneralController controller = Get.find();
  List<HelpTileModel> helpTiles = [
    HelpTileModel(
        imagePath: 'assets/images/feedback.png', text: 'Your feedback counts'),
    HelpTileModel(imagePath: 'assets/images/star.png', text: 'Rate the app'),
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
    return InkWell(
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

  void yourFeedBack() {
    Get.to(() => const FeedbackScreen());
  }

  void rateTheApp() async {
    await _launchURL(
        'https://play.google.com/store/apps/details?id=com.losthut.android.apps.simplemeditationtimer');
  }

  void support() {
    Get.to(()=> const Support());
    // showCupertinoModalBottomSheet(
    //     expand: false,
    //     context: context,
    //     backgroundColor: Colors.transparent,
    //     builder: (context) =>
    //         Container(
    //             height: Get.height * .3,
    //             child: inApp())
    // );
  }

  void shareWithFriends() async {
    Share.share(
        'https://play.google.com/store/apps/details?id=com.losthut.android.apps.simplemeditationtimer');
  }

  void joinMailingList() {
    Get.to(() => const JoinMailingList());
  }

  void facebookPage() async {
    await _launchURL('https://www.facebook.com/vipassanameditationtimer');
  }

  void learnMoreAboutUs() async {
    _launchURL('https://vpassana.com/about-us/');
  }

  void advanceFeature() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        builder: (context) {
          return GoogleSignInSheet();
        });
  }

  void faqs() async {
    await _launchURL('https://vpassana.com/faq/');
  }

  void blog() async {
    await _launchURL('https://vpassana.com/blog/');
  }

  void privacyAnTermOfService() {
    Get.to(()=> const PrivacyPolicy());
  }

  _launchURL(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }
}

class HelpTileModel {
  String imagePath;
  String text;

  HelpTileModel({required this.imagePath, required this.text});
}
