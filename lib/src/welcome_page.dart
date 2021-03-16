import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/weclome_video_widget.dart';
import 'package:flutter_app/src/widget/welcome_time_widget.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [

            Positioned. fill(child: WelcomeVideoWidget()),

            //右下角对其
            Positioned(
              child: WelcomeTimeWidget(),
              right: 20,
              bottom: 66,
            )
          ],
        ),
      ),
    );
  }
}
