import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/general_controller.dart';
import 'my_text.dart';

class SoundBottomSheet extends StatefulWidget {
  const SoundBottomSheet({Key? key}) : super(key: key);

  @override
  State<SoundBottomSheet> createState() => _SoundBottomSheetState();
}

class _SoundBottomSheetState extends State<SoundBottomSheet> {
  final GeneralController controller = Get.find();
  String file = '';
  String volume = '';
  String interval = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: MyText(
                    text: 'End of session sound clip.',
                    color: black,
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Obx(
                            () => GestureDetector(
                              onTap: controller.isUserLoggedIn.value
                                  ? () async {
                                      controller.sessionSoundClipIndex.value =
                                          index;
                                      var temp = await openFile();
                                      setState(() {
                                        file = temp;
                                      });
                                      controller.pickedFilePath.value = file;
                                    }
                                  : () {
                                      Get.snackbar('Please login',
                                          'Login First to use this feature');
                                    },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: controller.sessionSoundClipIndex
                                                    .value ==
                                                index
                                            ? innerBorderColor
                                            : black)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Center(
                                    child: Obx(
                                      () => controller.isUserLoggedIn.value
                                          ? MyText(
                                              text: 'Add you own sound',
                                              color: controller
                                                          .sessionSoundClipIndex
                                                          .value ==
                                                      index
                                                  ? innerBorderColor
                                                  : selectedBorderColor,
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                MyText(
                                                  text: 'Add you own sound',
                                                  color: controller
                                                              .sessionSoundClipIndex
                                                              .value ==
                                                          index
                                                      ? innerBorderColor
                                                      : selectedBorderColor,
                                                ),
                                                SizedBox(
                                                    height: 40,
                                                    width: 40,
                                                    child: Image.asset(
                                                        'assets/images/gree_lock.png')),
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return Obx(
                          () => GestureDetector(
                            onTap: () async {
                              controller.sessionSoundClipIndex.value = index;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: controller.sessionSoundClipIndex
                                                  .value ==
                                              index
                                          ? innerBorderColor
                                          : black)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Center(
                                  child: Obx(
                                    () => MyText(
                                      text: sounds[index],
                                      color: controller.sessionSoundClipIndex
                                                  .value ==
                                              index
                                          ? innerBorderColor
                                          : selectedBorderColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 10);
                      },
                      itemCount: sounds.length),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: MyText(
                    text: 'Volume',
                    color: black,
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SliderTheme(
                    data: const SliderThemeData(trackHeight: 10),
                    child: Obx(
                      () => Slider(
                          min: 0,
                          max: 10,
                          divisions: 10,
                          label: volume,
                          activeColor: selectedBorderColor,
                          inactiveColor: selectedBorderColor.withOpacity(.26),
                          value: controller.volume.value,
                          onChanged: (val) {
                            controller.audioPlayer.setVolume(val / 10);
                            controller.volume.value = val;
                            setState(() {
                              volume=val.toInt().toString();
                            });
                          }),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 5),
                  child: MyText(
                    text: 'Repeat',
                    color: black,
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: MyText(
                    text: 'Time the sound clip should play',
                    color: black,
                    size: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SliderTheme(
                    data: const SliderThemeData(trackHeight: 10),
                    child: Obx(
                      () => Slider(
                          min: 0,
                          max: 3,
                          divisions: 3,
                          label: interval,
                          activeColor: selectedBorderColor,
                          inactiveColor: selectedBorderColor.withOpacity(.26),
                          value: controller.repeat.value,
                          onChanged: (val) {
                            controller.repeat.value = val;
                            setState(() {
                              interval=val.toInt().toString();
                            });
                          }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
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
      ),
    );
  }

  Future<String> openFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result == null) return '';
    setState(() {
      file = result.files.first.path.toString();
    });

    return result.files.single.path.toString();
  }
}
