import 'package:flutter/material.dart';
import 'package:web_portfolio/components/header_text.dart';
import 'package:video_player/video_player.dart';
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
        VideoPlayerController.asset('lib/videos/vendorhive360.mp4')
          ..initialize().then((_) {
            _videoPlayerController.play();
            _videoPlayerController.setLooping(true);
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(children: [
        Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(color: Colors.white),
            child: HeaderText(
                text: portfolio_data[widget.mainIndex][0],
                fontsize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textAlign: TextAlign.left)),
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
    );
  }
}
