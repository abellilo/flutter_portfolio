import 'package:flutter/material.dart';

import 'header_text.dart';
import 'my_color.dart';

class PortfolioItem extends StatelessWidget {
  final List portfolioItem;

  const PortfolioItem(
      {super.key,
      required this.portfolioItem,});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 968 ?
    Container(
      decoration: BoxDecoration(
        color: MyColors.background_color,
      ),
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
    )
    :Container(
      decoration: BoxDecoration(
        color: MyColors.background_color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //app type or name
                HeaderText(
                    text: portfolioItem[0],
                    fontsize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    textAlign: TextAlign.center),
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
                //app icon and stack
                //app icon
                Image.asset(
                  "lib/assets/mobile-app.png",
                  height: 25,
                ),
                //code stack
                HeaderText(
                    text: portfolioItem[2],
                    fontsize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    textAlign: TextAlign.center),

                const SizedBox(
                  height: 20,
                ),
                //app description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: HeaderText(
                      text:
                      portfolioItem[1],
                      fontsize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                      textAlign: TextAlign.center),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Image.asset(
                portfolioItem[3],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Image.asset(
                portfolioItem[4],
              ),
            ),
          )
        ],
      ),
    );
  }
}
