import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/components/header_text.dart';
import 'package:web_portfolio/components/homepage_header.dart';
import 'package:web_portfolio/components/portfolio_item.dart';
import 'package:web_portfolio/data/portfolio_data.dart';
import '../components/my_color.dart';
import 'view_portfolio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //instagram link
  final Uri _url_instagram = Uri.parse('https://www.instagram.com/abellilo/');
  //twitter link
  final Uri _url_twitter = Uri.parse('https://twitter.com/_abellilo');
  //facebook link
  final Uri _url_facebook = Uri.parse('https://web.facebook.com/abel.lilo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.background_color,
        body: SafeArea(
          child: Column(
            children: [
              //website header
              HomePageHeader(),

              Flexible(child: CustomScrollView(
                slivers: [
                  SliverList(delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                      (context, index){
                        return MediaQuery.of(context).size.width > 627 ?
                        SizedBox(
                          height: 120,
                        )
                        :SizedBox(
                          height: 40,
                        );
                      }
                  )),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: portfolio_data.length,
                        (context, index){
                          return Column(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPortfolio(
                                    mainIndex: index,
                                  ))),
                                  child: PortfolioItem(
                                    portfolioItem: portfolio_data[index],
                                  ),
                                ),
                              ),
                              MediaQuery.of(context).size.width > 627 ?
                              SizedBox(
                                height: 150,
                              )
                                  :SizedBox(
                                height: 40,
                              ),
                            ],
                          );
                        }
                    ),
                  ),
                  SliverList(delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                      (context, index){
                        return Column(
                          children: [
                            Center(
                              child: HeaderText(
                                text: "CREATED BY ABELLILO",
                                textAlign: TextAlign.center,
                                fontsize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () async{
                                      if (!await launchUrl(_url_instagram)) {
                                      throw Exception('Could not launch $_url_instagram');
                                      }
                                    },
                                    icon: FaIcon(FontAwesomeIcons.instagram)),
                                IconButton(
                                    onPressed: () async{
                                      if (!await launchUrl(_url_twitter)) {
                                      throw Exception('Could not launch $_url_twitter');
                                      }
                                    },
                                    icon: FaIcon(FontAwesomeIcons.twitter)),
                                IconButton(
                                    onPressed: () async{
                                      if (!await launchUrl(_url_facebook)) {
                                        throw Exception('Could not launch $_url_facebook');
                                      }
                                    },
                                    icon: FaIcon(FontAwesomeIcons.facebook))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      }
                  ))
                ],
              )),
            ],
          ),
        ));
  }
}
