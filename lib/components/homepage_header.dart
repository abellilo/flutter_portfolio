import 'package:flutter/material.dart';
import 'package:web_portfolio/components/header_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    //github link
    final Uri _url_github = Uri.parse('https://github.com/abellilo');

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(
                    text: "Abel Ayinde Portfolio",
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    textAlign: TextAlign.left),
                const SizedBox(
                  height: 10,
                ),
                HeaderText(
                    text: "I am a website and mobile app developer",
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    textAlign: TextAlign.left),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                    onPressed: () async{
                      if (!await launchUrl(_url_github)) {
                        throw Exception('Could not launch $_url_github');
                      }
                    },
                    icon: FaIcon(FontAwesomeIcons.github)),

                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async{
                      if (!await launchUrl(_url_github)) {
                        throw Exception('Could not launch $_url_github');
                      }
                    },
                    child: HeaderText(
                        text: "GITHUB",
                        fontsize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        textAlign: TextAlign.left),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
