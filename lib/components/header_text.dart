import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const HeaderText({super.key,
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
      GoogleFonts.openSans(fontSize: fontsize, fontWeight: fontWeight, color: color),
    );
  }
}
