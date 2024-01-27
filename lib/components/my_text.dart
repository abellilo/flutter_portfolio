import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const MyText(
      {super.key,
      required this.text,
      required this.fontsize,
      required this.fontWeight,
      required this.color,
      required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style:
          TextStyle(fontSize: fontsize, fontWeight: fontWeight, color: color),
    );
  }
}
