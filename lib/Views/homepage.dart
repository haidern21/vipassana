import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:vipassana/Views/meditation_log.dart';
import 'package:vipassana/Widgets/google_signin_sheet.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/Widgets/sound_bottom_sheet.dart';
import 'package:vipassana/constants.dart';
import '../controller/general_controller.dart';
import 'help_and_more.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = CountDownController();
  final GeneralController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    List<PopupMenuItem> items = [
      PopupMenuItem(
          child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              builder: (context) => Obx(() => controller.isUserLoggedIn.value
                  ? sessionsBottomSheet()
                  :  GoogleSignInSheet()));
        },
        child: popUpMenuItem(
          imagePath: 'assets/images/sessions_image.png',
          text: 'Sessions',
        ),
      )),
      PopupMenuItem(
          child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          // Get.bottomSheet(Obx(() => controller.isUserLoggedIn.value
          //     ? const SoundBottomSheet()
          //     : const GoogleSignInSheet()));
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              builder: (context) => Obx(() => controller.isUserLoggedIn.value
                  ? const SoundBottomSheet()
                  :  GoogleSignInSheet()));
        },
        child: popUpMenuItem(
          imagePath: 'assets/images/sounds_image.png',
          text: 'Sounds',
        ),
      )),
      PopupMenuItem(
          child: Obx(
        () => GestureDetector(
          onTap: controller.isUserLoggedIn.value
              ? () => Get.to(() => const MeditationLog())
              : () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0)),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (context) =>  GoogleSignInSheet());
                },
          child: popUpMenuItem(
            imagePath: 'assets/images/logs_image.png',
            text: 'Logs',
          ),
        ),
      )),
      PopupMenuItem(
        child: GestureDetector(
          onTap: () => Get.to(() => const HelpAndMore()),
          child: popUpMenuItem(
            imagePath: 'assets/images/search_image.png',
            text: 'More',
          ),
        ),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              gradientColor1,
              gradientColor2,
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      child: const SizedBox(
                        child: Icon(
                          Icons.more_vert,
                          color: white,
                          size: 30,
                        ),
                      ),
                      itemBuilder: (context) {
                        return List.generate(items.length, (index) {
                          return items[index];
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Obx(
                    () => controller.leadingTime.value == 5.0
                        ? const MyText(
                            text: 'Leading Time: 5: 00"',
                            color: white,
                            size: 17,
                          )
                        : MyText(
                            text:
                                'Leading Time: ${controller.leadingTime.value.toString().substring(0, 1)}:${controller.leadingTime.value.toString().substring(2, 4)}"',
                            color: white,
                            size: 17,
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Obx(
                    () => controller.intervalTime.value == 5.0
                        ? const MyText(
                            text: 'Interval: 5: 00"',
                            color: white,
                            size: 17,
                          )
                        : MyText(
                            text:
                                'Interval: ${controller.intervalTime.value.toString().substring(0, 1)}:${controller.intervalTime.value.toString().substring(2, 4)}"',
                            color: white,
                            size: 17,
                          ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      _controller.restart();
                    },
                    child: Stack(
                      children: [
                        NeonCircularTimer(
                          width: 200,
                          duration: 6500,
                          controller: _controller,
                          strokeWidth: 15,
                          backgroudColor: Colors.transparent,
                          isTimerTextShown: true,
                          neumorphicEffect: true,
                          autoStart: false,
                          neon: 0,
                          onStart: (){
                            print('STARTED');
                          },
                          neonColor: innerBorderColor,
                          innerFillColor: neonColor.withOpacity(.26),
                          outerStrokeColor: neonColor,
                          onComplete: () async {
                            if (controller.sessionSoundClipIndex.value == 0 &&
                                controller.pickedFilePath.value.isNotEmpty) {
                              await controller.audioPlayer.play(DeviceFileSource(
                                  controller.pickedFilePath.value));
                            }
                            await controller.audioPlayer.play(AssetSource(soundPaths[
                                controller.sessionSoundClipIndex.value]));
                          },
                        ),
                        Positioned(
                            bottom: 30,
                            left: Get.width * .43,
                            child: Image.asset(
                              'assets/images/loop.png',
                              height: 20,
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Image.asset('assets/images/bg_visual_effects.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 90,
                  width: double.infinity,
                  child: ListView.separated(
                    itemCount: 12,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.numberOfMinutesIndex.value = index;
                            _controller.restart(
                                // duration: ((index + 1) ) * 60);
                                duration: ((index + 1) * 5)); //*60
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: controller.numberOfMinutesIndex.value ==
                                        index
                                    ? selectedBorderColor
                                    : Colors.transparent,
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                    border: Border.all(
                                        color: innerBorderColor, width: 3)),
                                child: Center(
                                  child: MyText(
                                    text: ((index + 1) * 5).toString(),
                                    // text: ((index + 1) ).toString(),
                                    color: black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sessionsBottomSheet() {
    return Container(
      height: Get.height * .7,
      width: Get.width,
      decoration: const BoxDecoration(
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: MyText(
                  text: 'Leading Time',
                  color: black,
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ),
              const MyText(
                text:
                    'An interval to dedicate to mindful prestration,\nMETTA or other rituals preceding the meditation\nsession',
                color: black,
                size: 14,
                maxLines: 3,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SliderTheme(
                  data: const SliderThemeData(trackHeight: 10),
                  child: Obx(
                    () => Slider(
                        min: 0,
                        max: 10,
                        activeColor: selectedBorderColor,
                        inactiveColor: selectedBorderColor.withOpacity(.26),
                        value: controller.leadingTime.value,
                        onChanged: (val) {
                          controller.leadingTime.value = val;
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyText(
                      text: 'Session Loop',
                      color: black,
                      weight: FontWeight.bold,
                      size: 20,
                    ),
                    SizedBox(
                      height: 20,
                      width: 40,
                      child: Obx(
                        () => CupertinoSwitch(
                            trackColor: selectedBorderColor,
                            thumbColor: white,
                            activeColor: selectedBorderColor,
                            value: controller.sessionLoop.value,
                            onChanged: (val) {
                              controller.sessionLoop.value = val;
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const MyText(
                text:
                    'Repeat twice to allow for Walking and Setting consecutive practices',
                maxLines: 2,
                color: black,
                size: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: MyText(
                  text: 'Interval Time',
                  color: black,
                  weight: FontWeight.bold,
                  size: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: MyText(
                  text: 'Break between walking and sitting sessions.',
                  maxLines: 1,
                  color: black,
                  size: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SliderTheme(
                  data: const SliderThemeData(trackHeight: 10),
                  child: Obx(
                    () => Slider(
                        min: 0,
                        max: 10,
                        activeColor: selectedBorderColor,
                        inactiveColor: selectedBorderColor.withOpacity(.26),
                        value: controller.intervalTime.value,
                        onChanged: (val) {
                          controller.intervalTime.value = val;
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: Get.width * .8,
                      decoration: BoxDecoration(
                          color: selectedBorderColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: MyText(
                            text: 'Save',
                            color: white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget popUpMenuItem({required String imagePath, required String text}) {
    return SizedBox(
      height: 30,
      width: 100,
      child: Row(
        children: [
          Image.asset(
            imagePath,
            color: black,
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          MyText(
            text: text,
            color: black,
          )
        ],
      ),
    );
  }
}
