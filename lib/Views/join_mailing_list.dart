import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/constants.dart';

class JoinMailingList extends StatefulWidget {
  const JoinMailingList({Key? key}) : super(key: key);

  @override
  State<JoinMailingList> createState() => _JoinMailingListState();
}

class _JoinMailingListState extends State<JoinMailingList> {
  var email = TextEditingController();
  var name = TextEditingController();
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const MyText(
                    text:
                        'The mailing list is free to join and will provide you with a way to keep informed about \n\n • Progress about the app \n • Community related announcements \n • Vipassana Meditation news',
                    size: 16,
                    weight: FontWeight.w400,
                    color: black,
                    maxLines: 10,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyText(
                    text: 'Your Name',
                    size: 16,
                    color: black,
                    weight: FontWeight.bold,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: name,
                    validator: (val) {
                      if (val!.isEmpty ) {
                        return 'Enter valid name';
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
                    height: 20,
                  ),
                  const MyText(
                    text: 'Your Email',
                    size: 16,
                    color: black,
                    weight: FontWeight.bold,
                    textAlign: TextAlign.justify,
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
                    height: 80,
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
