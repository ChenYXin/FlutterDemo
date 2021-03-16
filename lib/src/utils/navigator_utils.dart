import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorUtils {
  static void pagePush({
    @required BuildContext context,
    @required Widget targetPage,
    bool isReplace = false,
    Function(dynamic value) dismissCallBck,
  }) {
    PageRoute pageRoute;
    if (Platform.isAndroid) {
      pageRoute = MaterialPageRoute(builder: (BuildContext context) {
        return targetPage;
      });
    } else {
      pageRoute = CupertinoPageRoute(builder: (BuildContext context) {
        return targetPage;
      });
    }

    if (isReplace) {
      Navigator.of(context).pushReplacement(pageRoute).then((value) {
        if (dismissCallBck != null) {
          dismissCallBck(value);
        }
      });
    } else {
      Navigator.of(context).push(pageRoute).then((value) {
        if (dismissCallBck != null) {
          dismissCallBck(value);
        }
      });
    }
  }

  static void pagePushByFade({
    @required BuildContext context,
    @required Widget targetPage,
    bool isReplace = false,
    bool opaque = false,
    Function(dynamic value) dismissCallBck,
  }) {
    PageRoute pageRoute = PageRouteBuilder(
      opaque: opaque, //背景是否透明
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return targetPage;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );

    if (isReplace) {
      Navigator.of(context).pushReplacement(pageRoute).then((value) {
        if (dismissCallBck != null) {
          dismissCallBck(value);
        }
      });
    } else {
      Navigator.of(context).push(pageRoute).then((value) {
        if (dismissCallBck != null) {
          dismissCallBck(value);
        }
      });
    }
  }
}
