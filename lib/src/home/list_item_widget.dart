import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class ListViewItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewItemWidgetState();
  }
}

class _ListViewItemWidgetState extends State<ListViewItemWidget> {
  VideoPlayerController _controller;
  bool _isPlay = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/welcome.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [Icon(Icons.one_k), Text("早起的年轻人")],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 160,
            child: Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      _controller.pause();
                      _isPlay = false;
                      setState(() {});
                    },
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
                buildControllerWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildControllerWidget() {
    if (_isPlay) {
      return Container();
    }
    return Positioned.fill(
        child: Container(
      child: GestureDetector(
        onTap: () {
          _isPlay = true;
          _controller.play();
          setState(() {});
        },
        child: Icon(
          Icons.play_circle_fill,
          size: 44,
        ),
      ),
      color: Colors.blueGrey.withOpacity(0.5),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
