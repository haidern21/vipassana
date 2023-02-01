import 'package:flutter/material.dart';
import 'package:vipassana/Widgets/my_text.dart';
import 'package:vipassana/constants.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              const MyText(
                text: 'Your Feedback Counts',
                color: black,
                size: 20,
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 30,),
              TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: 'Enter feedback',
                  contentPadding:const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
                ),
              ),
              const SizedBox(height: 15,),
              const MyText(
                text: 'Your Email',
                color: black,
                size: 20,
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 10,),
              TextField(
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'mail@mail.com',
                    contentPadding:const EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                ),
              ),
              const SizedBox(height: 50,),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
