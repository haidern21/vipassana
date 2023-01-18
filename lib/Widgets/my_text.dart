import 'package:flutter/material.dart';
import 'package:vipassana/constants.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? size;
  final int? maxLines;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? textAlign;

  const MyText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.weight,
      this.color,
      this.maxLines,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      style: TextStyle(
        color: color ?? white,
        fontWeight: weight,
        fontSize: size ?? 16,
      ),
    );
  }
}
