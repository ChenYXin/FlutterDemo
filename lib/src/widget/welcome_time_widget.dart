import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/home_page.dart';
import 'package:flutter_app/src/utils/log_utils.dart';
import 'package:flutter_app/src/utils/navigator_utils.dart';

class WelcomeTimeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WelcomeTimeWidgetState();
  }
}

class _WelcomeTimeWidgetState extends State<WelcomeTimeWidget> {
  int currentTime = 5;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentTime == 0) {
        _timer.cancel();
        goHome();
        return;
      }

      currentTime--;

      setState(() {});

      LogUtils.e("计时器回调");
    });
  }

  @override
  void dispose() {
    if (_timer.isActive) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //手势动作
    return GestureDetector(
      onTap: () {
        goHome();
      },
      child: buildContainer(),
    );
  }

  Container buildContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      alignment: Alignment.center,
      child: Text(
        "${currentTime}s",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.redAccent,
        ),
      ),
      width: 100,
      height: 33,
    );
  }

  void goHome() {
    LogUtils.e("去首页");

    NavigatorUtils.pagePushByFade(context: context, targetPage: HomePage(),isReplace: true);
  }
}
