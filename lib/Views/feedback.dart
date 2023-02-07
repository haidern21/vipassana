import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/constants.dart';
import 'package:vipassana/controller/general_controller.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  var email = TextEditingController();
  var feedback = TextEditingController();
  var key = GlobalKey<FormState>();
  GeneralController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const MyText(
                    text: 'Your Feedback Counts',
                    color: black,
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    maxLines: 6,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter feedback';
                      }
                    },
                    controller: feedback,
                    decoration: InputDecoration(
                        hintText: 'Enter feedback',
                        contentPadding: const EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const MyText(
                    text: 'Your Email',
                    color: black,
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: email,
                    validator: (val) {
                      if (val!.isEmpty ||
                          val.contains('@') == false ||
                          val.contains('.') == false) {
                        return 'Enter valid email';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'mail@mail.com',
                        contentPadding: const EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (key.currentState!.validate()) {
                        await controller.uploadFeedbackToServer(
                            email: email.text, feedback: feedback.text);
                        final Email sendEmail = Email(
                          body:
                              'Hey admin here is the feedback given by ${email.text}\n Feedback: ${feedback.text}',
                          subject: 'subject of email',
                          recipients: ['contact@vpassana.com'],
                        );
                        await FlutterEmailSender.send(sendEmail);
                        Future.delayed(
                            const Duration(seconds: 1), () => Get.back());
                      } else {
                        Get.snackbar('Error', 'Enter required fields');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: selectedBorderColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: MyText(
                            text: 'Send',
                            color: white,
                            size: 18,
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
      ),
    );
  }
}
