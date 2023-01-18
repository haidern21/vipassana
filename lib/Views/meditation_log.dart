import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:vipassana/Widgets/my_text.dart';
import '../constants.dart';

class MeditationLog extends StatefulWidget {
  const MeditationLog({Key? key}) : super(key: key);

  @override
  State<MeditationLog> createState() => _MeditationLogState();
}

class _MeditationLogState extends State<MeditationLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const MyText(
                text: 'Meditation Log',
                color: black,
                size: 18,
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: Get.height * .5,
                child: SfCalendar(
                  view: CalendarView.month,
                  cellBorderColor: Colors.transparent,
                  backgroundColor: greyColor,
                  showNavigationArrow: true,
                  headerStyle: const CalendarHeaderStyle(
                      backgroundColor: headerGreyColor,
                      textAlign: TextAlign.center),
                  todayHighlightColor: selectedBorderColor,
                  selectionDecoration: BoxDecoration(
                      border: Border.all(color: selectedBorderColor)),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: selectedBorderColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(
                      height: 90,
                      child: Image.asset(
                        'assets/images/meditation_outline_image.png',
                        color: black,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          MyText(
                            text: 'Sun January 15, 2023',
                            color: black,
                            size: 20,
                            weight: FontWeight.w600,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: MyText(
                              text: '00 Hours, 10 Minutes',
                              color: black,
                              size: 16,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
