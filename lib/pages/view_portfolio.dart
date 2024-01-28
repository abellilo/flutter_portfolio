import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_portfolio/components/header_text.dart';
import 'package:video_player/video_player.dart';
import 'package:web_portfolio/pages/homepage.dart';
import '../data/portfolio_data.dart';

class ViewPortfolio extends StatefulWidget {
  final int mainIndex;

  const ViewPortfolio({super.key, required this.mainIndex});

  @override
  State<ViewPortfolio> createState() => _ViewPortfolioState();
}

class _ViewPortfolioState extends State<ViewPortfolio> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(video_display[widget.mainIndex]))
          ..initialize().then((_) {
            _videoPlayerController.play();
            _videoPlayerController.setLooping(true);
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  @override
  void dispose(){
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return HomePage();
        }));
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Column(children: [
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Expanded(
                    child: HeaderText(
                        text: portfolio_data[widget.mainIndex][0],
                        fontsize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        textAlign: TextAlign.left),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.house
                      ),
                    ),
                  )
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height - 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
