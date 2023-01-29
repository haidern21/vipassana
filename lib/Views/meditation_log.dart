// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:vipassana/Widgets/my_text.dart';
// import 'package:vipassana/controller/general_controller.dart';
// import '../constants.dart';
//
// class MeditationLog extends StatefulWidget {
//   const MeditationLog({Key? key}) : super(key: key);
//
//   @override
//   State<MeditationLog> createState() => _MeditationLogState();
// }
//
// class _MeditationLogState extends State<MeditationLog> {
//   GeneralController controller=Get.find();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 15,
//               ),
//               const MyText(
//                 text: 'Meditation Log',
//                 color: black,
//                 size: 18,
//                 weight: FontWeight.w500,
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: Get.height * .5,
//                 child: SfCalendar(
//                   view: CalendarView.month,
//                   cellBorderColor: Colors.transparent,
//                   backgroundColor: greyColor,
//                   showNavigationArrow: true,
//                   headerStyle: const CalendarHeaderStyle(
//                       backgroundColor: headerGreyColor,
//                       textAlign: TextAlign.center),
//                   todayHighlightColor: selectedBorderColor,
//                   selectionDecoration: BoxDecoration(
//                       border: Border.all(color: selectedBorderColor)),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               FutureBuilder(
//                 future: controller.getUserMeditations(userId: '8494655655814581'),
//                 builder: (context,data) {
//                   if(data.connectionState==ConnectionState.done){
//                   return Container(
//                     height: Get.height * .33,
//                     child: ListView.builder(
//                       itemCount: controller.meditations.length,
//                       itemBuilder: (context,index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: Container(
//                             height: 100,
//                             decoration: BoxDecoration(
//                                 color: selectedBorderColor,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   height: 90,
//                                   child: Image.asset(
//                                     'assets/images/meditation_outline_image.png',
//                                     color: black,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 SizedBox(
//                                   height: 90,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children:  [
//                                       MyText(
//                                         text: '${DateTime.parse(controller.meditations[index]['dateTime']).day} ${DateTime.parse(controller.meditations[index]['dateTime']).month},${DateTime.parse(controller.meditations[index]['dateTime']).year}',
//                                         color: black,
//                                         size: 20,
//                                         weight: FontWeight.w600,
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(top: 10.0),
//                                         child: MyText(
//                                           text: '${controller.meditations[index]['meditationTime']}',
//                                           color: black,
//                                           size: 16,
//                                           weight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }
//                     ),
//                   );
//
//                   }
//                 else{
//                   return const Center(
//                     child: CircularProgressIndicator(color: gradientColor1,),
//                   );
//                   }
//                 }
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/controller/general_controller.dart';
import '../constants.dart';

class MeditationLog extends StatefulWidget {
  const MeditationLog({Key? key}) : super(key: key);

  @override
  State<MeditationLog> createState() => _MeditationLogState();
}

class _MeditationLogState extends State<MeditationLog> {
  GeneralController controller = Get.find();
  RxBool showLoader=false.obs;
  RxString noValText=''.obs;

  @override
  void initState() {
    // TODO: implement initState
    initFunction();
    super.initState();
  }

  initFunction() async {
    controller.meditations.value=[];

    List dateInMed=[];
    showLoader.value=true;
    await controller.getUserMeditations(
        userId: '8494655655814581');
    showLoader.value=false;
    print(DateTime.now());
    for (var elements in  controller.meditations){
      if(DateTime.parse(elements['dateTime']).day==DateTime.now().day&&DateTime.parse(elements['dateTime']).month==DateTime.now().month&&DateTime.parse(elements['dateTime']).year==DateTime.now().year){
        dateInMed.add(elements);
      }
    }
    controller.meditations.value=dateInMed;

  }
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
                  onTap: (calender) async{
                    controller.meditations.value=[];

                    List dateInMed=[];
                    showLoader.value=true;
                    await controller.getUserMeditations(
                        userId: '8494655655814581');
                    showLoader.value=false;
                    print(calender.date);
                    for (var elements in  controller.meditations){
                      if(DateTime.parse(elements['dateTime']).day==calender.date?.day&&DateTime.parse(elements['dateTime']).month==calender.date?.month&&DateTime.parse(elements['dateTime']).year==calender.date?.year){
                        dateInMed.add(elements);
                      }
                    }
                    controller.meditations.value=dateInMed;

                  },
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
              // Container(
              //   height: 100,
              //   decoration: BoxDecoration(
              //       color: selectedBorderColor,
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Row(
              //     children: [
              //       SizedBox(
              //         height: 90,
              //         child: Image.asset(
              //           'assets/images/meditation_outline_image.png',
              //           color: black,
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              // SizedBox(
              //   height: 90,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: const [
              //       MyText(
              //         text: 'Sun January 15, 2023',
              //         color: black,
              //         size: 20,
              //         weight: FontWeight.w600,
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(top: 10.0),
              //         child: MyText(
              //           text: '00 Hours, 10 Minutes',
              //           color: black,
              //           size: 16,
              //           weight: FontWeight.w400,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),


                       SizedBox(
                        height: Get.height * .33,
                        child: Obx(()=>
                           showLoader.value==false?ListView.builder(
                              itemCount: controller.meditations.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MyText(
                                                text:
                                                    '${DateTime.parse(controller.meditations[index]['dateTime']).day} ${DateTime.parse(controller.meditations[index]['dateTime']).month},${DateTime.parse(controller.meditations[index]['dateTime']).year}',
                                                color: black,
                                                size: 20,
                                                weight: FontWeight.w600,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10.0),
                                                child: MyText(
                                                  text:
                                                      '${controller.meditations[index]['meditationTime']}',
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
                                );
                              }):showLoader.value==true?Center(
                                 child: CircularProgressIndicator(
                                   color: gradientColor1,
                                 ),
                        ):Center(
                              child: Text('No meditations available for the selected date'),
                            ),))
                    //
                    //  else if(controller.meditations.isEmpty){
                    //   return Obx(()=>
                    //      Center(
                    //       child: Text('${noValText}'),
                    //     ),
                    //   );
                    //
                    // }
                    // else{
                    //   return const Center(
                    //     child: CircularProgressIndicator(
                    //       color: gradientColor1,
                    //     ),
                    //   );
                    // }

            ],
          ),
        ),
      ),
    );
  }
}
