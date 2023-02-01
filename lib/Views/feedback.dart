import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/constants.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  var email = TextEditingController();
  var feedback = TextEditingController();
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
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
                    onTap: () {
                      if (key.currentState!.validate()) {
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
