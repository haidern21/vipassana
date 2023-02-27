import 'dart:developer';
import 'package:circle_list/circle_list.dart';
import 'package:circular_motion/circular_motion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:vipassana/Views/meditation_log.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/Widgets/sound_bottom_sheet.dart';
import 'package:vipassana/constants.dart';
import '../Widgets/google_signin_sheet.dart';
import '../controller/general_controller.dart';
import '../local_notifications.dart';
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
  var meditationDuration = ''.obs;
  AudioPlayer audioPlayer = AudioPlayer();
  LocalNotifications localNotifications = LocalNotifications();
  var timeTillComplete = 0;

  @override
  void initState() {
    localNotifications.initializeNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<PopupMenuItem<int>> items = [
      PopupMenuItem(
          value: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0)),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  builder: (context) => sessionsBottomSheet());
            },
            child: popUpMenuItem(
                imagePath: 'assets/images/sessions_image.png',
                text: 'Sessions',
                isSvg: false),
          )),
      PopupMenuItem(
          value: 1,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0)),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  builder: (context) => const SoundBottomSheet());
            },
            child: popUpMenuItem(
                imagePath: 'assets/svg_assets/icons8-low-volume.svg',
                text: 'Sounds',
                isSvg: true),
          )),
      PopupMenuItem(
        value: 2,
        child: GestureDetector(
          onTap: () => Get.to(() => const MeditationLog()),
          child: popUpMenuItem(
              imagePath: 'assets/svg_assets/icons8-regular-document.svg',
              text: 'Logs',
              isSvg: true),
        ),
      ),
      PopupMenuItem(
        value: 3,
        child: GestureDetector(
          onTap: () => Get.to(() => const HelpAndMore()),
          child: popUpMenuItem(
              imagePath: 'assets/svg_assets/icons8-search-more.svg',
              text: 'More',
              isSvg: true),
        ),
      ),
    ];
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            gradientColor1,
            gradientColor2,
          ],
        )),
        child: Stack(
          children: [
            Positioned(
              bottom: Get.height * .17,
              child: SizedBox(
                // height: Get.height*.3,
                // width: Get.width,
                child: Image.asset('assets/images/bg_visual_effects.png'),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0,),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                         color: neonColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(15.0),
                            //   child: PopupMenuButton(
                            //     onSelected: (val) {
                            //       if (val == 0) {
                            //         showModalBottomSheet(
                            //             context: context,
                            //             shape: const RoundedRectangleBorder(
                            //               borderRadius: BorderRadius.vertical(
                            //                   top: Radius.circular(25.0)),
                            //             ),
                            //             clipBehavior: Clip.antiAliasWithSaveLayer,
                            //             builder: (context) => sessionsBottomSheet());
                            //         log('index 0');
                            //       }
                            //       if (val == 1) {
                            //         showModalBottomSheet(
                            //             context: context,
                            //             shape: const RoundedRectangleBorder(
                            //               borderRadius: BorderRadius.vertical(
                            //                   top: Radius.circular(25.0)),
                            //             ),
                            //             clipBehavior: Clip.antiAliasWithSaveLayer,
                            //             builder: (context) =>
                            //                 const SoundBottomSheet());
                            //         log('index 1');
                            //       }
                            //       if (val == 2) {
                            //         log('index 2');
                            //         Get.to(() => const MeditationLog());
                            //       }
                            //       if (val == 3) {
                            //         log('index 3');
                            //         Get.to(() => const HelpAndMore());
                            //       }
                            //     },
                            //     child: const SizedBox(
                            //       child: Icon(
                            //         Icons.more_vert,
                            //         color: white,
                            //         size: 30,
                            //       ),
                            //     ),
                            //     itemBuilder: (context) {
                            //       return List.generate(items.length, (index) {
                            //         return items[index];
                            //       });
                            //     },
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0)),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    builder: (context) => sessionsBottomSheet());
                              },
                              child: popUpMenuItem(
                                  imagePath: 'assets/images/ico_meditation_session_up.png',
                                  text: 'Sessions',
                                  isSvg: false),
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0)),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    builder: (context) => const SoundBottomSheet());
                              },
                              child: popUpMenuItem(
                                  imagePath:
                                      'assets/images/ico_sounds_library.png',
                                  text: 'Sounds',
                                  isSvg: false),
                            ),
                            GestureDetector(
                              onTap: () => Get.to(() => const MeditationLog()),
                              child: popUpMenuItem(
                                  imagePath:
                                      'assets/images/ico_simple_log_up.png',
                                  text: 'Logs',
                                  isSvg: false),
                            ),
                            GestureDetector(
                              onTap: () => Get.to(() => const HelpAndMore()),
                              child: popUpMenuItem(
                                  imagePath:
                                      'assets/images/ico_hearth.png',
                                  text: 'More',
                                  isSvg: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  SizedBox(
                    height: Get.height * .65,
                    child: CircleList(
                      initialAngle: 5.25,
                      origin: const Offset(0, 22),
                      centerWidget: NeonCircularTimer(
                          width: 200,
                          duration: 6500,
                          controller: _controller,
                          strokeWidth: 15,
                          backgroudColor: Colors.transparent,
                          isTimerTextShown: true,
                          textStyle: TextStyle(fontSize: 35.sp),
                          neumorphicEffect: true,
                          autoStart: false,
                          neon: 0,
                          onStart: () {},
                          neonColor: innerBorderColor,
                          innerFillColor: neonColor.withOpacity(.26),
                          outerStrokeColor: neonColor,
                          onComplete: () async {
                            log(timeTillComplete.toString());
                            log(_controller.getTimeInSeconds().toString());
                            if (timeTillComplete ==
                                _controller.getTimeInSeconds()) {
                              log(_controller.getTimeInSeconds().toString());
                              // await playSoundWithInterval();
                              int repeatInterval =
                                  controller.repeat.value.toInt();
                              if (controller.sessionSoundClipIndex.value !=
                                  -1) {
                                await controller.audioPlayer.play(
                                  AssetSource(soundPaths[
                                      controller.sessionSoundClipIndex.value]),
                                );
                                controller.audioPlayer.onPlayerComplete
                                    .listen((event) async {
                                  print(controller.repeat.value
                                      .toInt()
                                      .toString());
                                  repeatInterval--;
                                  if (repeatInterval > 0) {
                                    await controller.audioPlayer.play(
                                      AssetSource(soundPaths[controller
                                          .sessionSoundClipIndex.value]),
                                    );
                                  } else {
                                    return;
                                  }
                                });
                              }
                              if (controller.isUserLoggedIn.value == true) {
                                var a = await controller.checkIfUserExistsInDb(
                                    userId: controller.userId.value);
                                if (a == 404) {
                                  await controller.uploadMeditationToServer(
                                      userId: controller.userId.value,
                                      meditationTime: meditationDuration.value);
                                  print('a=404');
                                } else {
                                  await controller.updateMeditations(
                                    docId: controller.userId.value,
                                    meditationTime: meditationDuration.value,
                                  );

                                  print('a=200');
                                }

                                if (controller.sessionSoundClipIndex.value ==
                                        0 &&
                                    controller
                                        .pickedFilePath.value.isNotEmpty) {
                                  await controller.audioPlayer.play(
                                      DeviceFileSource(
                                          controller.pickedFilePath.value));
                                }
                              }
                            }
                          }),
                      children: List.generate(
                          12,
                          (index) => Obx(
                                () => GestureDetector(
                                  onTap: () async {
                                    // await controller.audioPlayer.play(
                                    //   AssetSource(soundPaths[controller
                                    //       .sessionSoundClipIndex.value]),
                                    // );
                                    controller.totalTimer.value =
                                        ((index + 1) * 5) * 60; //60
                                    timeTillComplete =
                                        ((index + 1) * 5) * 60; //60
                                    meditationDuration.value =
                                        ((index + 1) * 5).toString();
                                    controller.numberOfMinutesIndex.value =
                                        index;
                                    localNotifications
                                        .initializeNotifications();
                                    print("SHOW NOTIFICATION called");
                                    await localNotifications.showNotification(
                                        controller.totalTimer.value);
                                    _controller.restart(
                                        // duration: ((index + 1) ) * 60);
                                        duration: ((index + 1) * 5) * 60); //*60
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: controller.numberOfMinutesIndex
                                                    .value ==
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
                                                color: innerBorderColor,
                                                width: 3)),
                                        child: Center(
                                          child: MyText(
                                            text: ((index + 1) * 5).toString(),
                                            // text: ((index + 1) ).toString(),
                                            color: black,
                                            size: 18.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width * .3,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Obx(
                              () => controller.leadingTime.value == 5.0
                                  ? Column(
                                      children: [
                                        MyText(
                                          text: 'Leading',
                                          color: white,
                                          size: 15.sp,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        MyText(
                                          text: '5: 00"',
                                          color: white,
                                          size: 15.sp,
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        MyText(
                                          text: 'Leading',
                                          color: white,
                                          size: 15.sp,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        MyText(
                                          text:
                                              '${controller.leadingTime.value.toString().substring(0, 1)}:${controller.leadingTime.value.toString().substring(2, 4)}"',
                                          color: white,
                                          size: 15.sp,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width * .3,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Obx(
                              () => controller.intervalTime.value == 5.0
                                  ? Column(
                                      children: [
                                        MyText(
                                          text: 'Interval',
                                          color: white,
                                          size: 15.sp,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        MyText(
                                          text: '5: 00"',
                                          color: white,
                                          size: 15.sp,
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        MyText(
                                          text: 'Interval',
                                          color: white,
                                          size: 15.sp,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        MyText(
                                          text:
                                              '${controller.intervalTime.value.toString().substring(0, 1)}:${controller.intervalTime.value.toString().substring(2, 4)}"',
                                          color: white,
                                          size: 15.sp,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       // _controller.restart();
                  //     },
                  //     child: Stack(
                  //       children: [
                  //         NeonCircularTimer(
                  //             width: 200,
                  //             duration: 6500,
                  //             controller: _controller,
                  //             strokeWidth: 15,
                  //             backgroudColor: Colors.transparent,
                  //             isTimerTextShown: true,
                  //             textStyle: TextStyle(
                  //                 fontSize: 35.sp
                  //             ),
                  //             neumorphicEffect: true,
                  //             autoStart: false,
                  //             neon: 0,
                  //             onStart: () {},
                  //             neonColor: innerBorderColor,
                  //             innerFillColor: neonColor.withOpacity(.26),
                  //             outerStrokeColor: neonColor,
                  //             onComplete: () async {
                  //               log(timeTillComplete.toString());
                  //               log(_controller.getTimeInSeconds().toString());
                  //               if (timeTillComplete ==
                  //                   _controller.getTimeInSeconds()) {
                  //                 log(_controller.getTimeInSeconds().toString());
                  //                 // await playSoundWithInterval();
                  //                 int repeatInterval =
                  //                     controller.repeat.value.toInt();
                  //                 if (controller.sessionSoundClipIndex.value !=
                  //                     -1) {
                  //                   await controller.audioPlayer.play(
                  //                     AssetSource(soundPaths[controller
                  //                         .sessionSoundClipIndex.value]),
                  //                   );
                  //                   controller.audioPlayer.onPlayerComplete
                  //                       .listen((event) async {
                  //                     print(controller.repeat.value
                  //                         .toInt()
                  //                         .toString());
                  //                     repeatInterval--;
                  //                     if (repeatInterval > 0) {
                  //                       await controller.audioPlayer.play(
                  //                         AssetSource(soundPaths[controller
                  //                             .sessionSoundClipIndex.value]),
                  //                       );
                  //                     } else {
                  //                       return;
                  //                     }
                  //                   });
                  //                 }
                  //                 if (controller.isUserLoggedIn.value == true) {
                  //                   var a =
                  //                       await controller.checkIfUserExistsInDb(
                  //                           userId: controller.userId.value);
                  //                   if (a == 404) {
                  //                     await controller.uploadMeditationToServer(
                  //                         userId: controller.userId.value,
                  //                         meditationTime:
                  //                             meditationDuration.value);
                  //                     print('a=404');
                  //                   } else {
                  //                     await controller.updateMeditations(
                  //                       docId: controller.userId.value,
                  //                       meditationTime: meditationDuration.value,
                  //                     );
                  //
                  //                     print('a=200');
                  //                   }
                  //
                  //                   if (controller.sessionSoundClipIndex.value ==
                  //                           0 &&
                  //                       controller
                  //                           .pickedFilePath.value.isNotEmpty) {
                  //                     await controller.audioPlayer.play(
                  //                         DeviceFileSource(
                  //                             controller.pickedFilePath.value));
                  //                   }
                  //                 }
                  //               }
                  //             }),
                  //         Obx(() => controller.sessionLoop.value == true
                  //             ? Positioned.fill(
                  //                 bottom: 30,
                  //                 child: Align(
                  //                   alignment: Alignment.bottomCenter,
                  //                   child: Image.asset(
                  //                     'assets/images/loop.png',
                  //                     height: 20,
                  //                   ),
                  //                 ))
                  //             : const SizedBox())
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sessionsBottomSheet() {
    return Container(
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
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: MyText(
                  text: 'Leading Time',
                  color: black,
                  size: 18.sp,
                  weight: FontWeight.bold,
                ),
              ),
              MyText(
                text:
                    'An interval to dedicate to mindful prestration,\nMETTA or other rituals preceding the meditation\nsession',
                color: black,
                size: 16.sp,
                maxLines: 3,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SliderTheme(
                  data: const SliderThemeData(trackHeight: 10),
                  child: Obx(
                    () => controller.isUserLoggedIn.value
                        ? Slider(
                            min: 0,
                            max: 10,
                            activeColor: selectedBorderColor,
                            inactiveColor: selectedBorderColor.withOpacity(.26),
                            value: controller.leadingTime.value,
                            onChanged: (val) {
                              controller.leadingTime.value = val;
                            })
                        : GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0)),
                                  ),
                                  builder: (context) {
                                    return GoogleSignInSheet();
                                  });
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Slider(
                                      min: 0,
                                      max: 10,
                                      activeColor: const Color(0xff9f9f9f),
                                      inactiveColor: const Color(0xff9f9f9f)
                                          .withOpacity(.26),
                                      value: 0,
                                      onChanged: (val) {
                                        showModalBottomSheet(
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          25.0)),
                                            ),
                                            builder: (context) {
                                              return GoogleSignInSheet();
                                            });
                                      }),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                          'assets/images/gree_lock.png')),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'Session Loop',
                      color: black,
                      weight: FontWeight.bold,
                      size: 18.sp,
                    ),
                    SizedBox(
                      height: 20,
                      width: 40,
                      child: Obx(
                        () => CupertinoSwitch(
                            trackColor: controller.sessionLoop.value
                                ? selectedBorderColor
                                : dividerColor.withOpacity(0.4),
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
              MyText(
                text:
                    'Repeat twice to allow for Walking and Setting consecutive practices',
                maxLines: 2,
                color: black,
                size: 16.sp,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: MyText(
                  text: 'Interval Time',
                  color: black,
                  weight: FontWeight.bold,
                  size: 18.sp,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: MyText(
                  text: 'Break between walking and sitting sessions.',
                  maxLines: 1,
                  color: black,
                  size: 16.sp,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SliderTheme(
                  data: const SliderThemeData(trackHeight: 10),
                  child: Obx(
                    () => controller.isUserLoggedIn.value
                        ? Slider(
                            min: 0,
                            max: 10,
                            activeColor: selectedBorderColor,
                            inactiveColor: selectedBorderColor.withOpacity(.26),
                            value: controller.intervalTime.value,
                            onChanged: (val) {
                              controller.intervalTime.value = val;
                            })
                        : GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0)),
                                  ),
                                  builder: (context) {
                                    return GoogleSignInSheet();
                                  });
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Slider(
                                      min: 0,
                                      max: 10,
                                      activeColor: const Color(0xff9f9f9f),
                                      inactiveColor: const Color(0xff9f9f9f)
                                          .withOpacity(.26),
                                      value: 0,
                                      onChanged: (val) {
                                        showModalBottomSheet(
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          25.0)),
                                            ),
                                            builder: (context) {
                                              return GoogleSignInSheet();
                                            });
                                      }),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                          'assets/images/gree_lock.png')),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 10),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: Get.width * .8,
                      decoration: BoxDecoration(
                          color: selectedBorderColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: MyText(
                            text: 'Save',
                            color: white,
                            size: 18.sp,
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

  Widget popUpMenuItem(
      {required String imagePath, required String text, required bool isSvg}) {
    return SizedBox(
      child: isSvg == false
          ? Image.asset(
              imagePath,
              color: black,
              height: 40.h,
              width: 50.w,
            )
          : SvgPicture.asset(
              imagePath,
              color: black,
              height: 40.h,
              width: 50.w,
            ),
    );
  }

  playSoundWithInterval() async {
    if (controller.intervalTime.toInt() == 0) {
      return;
    } else {
      await controller.audioPlayer.play(
        AssetSource(soundPaths[controller.sessionSoundClipIndex.value]),
        volume: 5,
      );
      setState(() {
        controller.intervalTime.value--;
      });
    }
  }
}
