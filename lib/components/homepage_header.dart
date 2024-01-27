import 'package:flutter/material.dart';
import 'package:web_portfolio/components/header_text.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderText(
              text: "Abel Ayinde Portfolio",
              fontsize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              textAlign: TextAlign.left),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (){},
              child: HeaderText(
                  text: "Contact",
                  fontsize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textAlign: TextAlign.left),
            ),
          ),
        ],
      ),
    );
  }
}
