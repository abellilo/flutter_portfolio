import 'package:flutter/material.dart';
import 'package:web_portfolio/components/my_text.dart';

import 'header_text.dart';

class PortfolioItem extends StatelessWidget {
  final List portfolioItem;

  const PortfolioItem(
      {super.key,
      required this.portfolioItem,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(
                    text: portfolioItem[0],
                    fontsize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    textAlign: TextAlign.left),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 50,
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 7,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      "lib/assets/mobile-app.png",
                      height: 25,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: HeaderText(
                          text: portfolioItem[2],
                          fontsize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                HeaderText(
                    text:
                    portfolioItem[1],
                    fontsize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade600,
                    textAlign: TextAlign.left)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              portfolioItem[3],
              width: MediaQuery.of(context).size.width / 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              portfolioItem[4],
              width: MediaQuery.of(context).size.width / 4,
            ),
          )
        ],
      ),
    );
  }
}
