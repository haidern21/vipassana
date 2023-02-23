import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
        imagePath: 'assets/svg_assets/feedback.svg', text: 'Your feedback counts'),
    HelpTileModel(imagePath: 'assets/svg_assets/icons8-star.svg', text: 'Rate the app'),
    HelpTileModel(imagePath: 'assets/svg_assets/support.svg', text: 'Support'),
    HelpTileModel(
        imagePath: 'assets/svg_assets/Icon feather-share-2.svg', text: 'Share with friends'),
    HelpTileModel(
        imagePath: 'assets/svg_assets/Icon feather-mail.svg', text: 'Join the mailing list'),
    HelpTileModel(
        imagePath: 'assets/svg_assets/Icon feather-facebook.svg', text: 'Facebook page'),
    HelpTileModel(
        imagePath: 'assets/svg_assets/learn more.svg', text: 'Learn more about us'),
    HelpTileModel(
        imagePath: 'assets/svg_assets/Icon feather-lock.svg', text: 'Advance Features'),
    HelpTileModel(imagePath: 'assets/svg_assets/faq.svg', text: 'FAQs'),
    HelpTileModel(imagePath: 'assets/svg_assets/icons8-regular-document.svg', text: 'Blog'),
    HelpTileModel(
        imagePath: 'assets/svg_assets/privacy.svg',
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
             Padding(
              padding:const EdgeInsets.symmetric(vertical: 20.0,horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                      onTap:()=> Get.back(),
                      child: const Icon(Icons.arrow_back_ios_new,color: black,size:18)),
                  const SizedBox(width: 20,),
                   MyText(
                    text: 'Help and More',
                    color: black,
                    size: 20.sp,
                    weight: FontWeight.w500,
                  ),
                ],
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
            SvgPicture.asset(
              imagePath,
              color: black,
            ),
            const SizedBox(
              width: 20,
            ),
            MyText(
              text: text,
              color: black,
              size: 17.sp,
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
        shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.vertical(top: Radius.circular(25.0)),
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
