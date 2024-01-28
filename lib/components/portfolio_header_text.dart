import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioHeaderText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const PortfolioHeaderText({Key? key,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    required this.color,
    required this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style:
      GoogleFonts.openSans(fontSize: fontsize, fontWeight: fontWeight, color: color),
    );
  }
}
