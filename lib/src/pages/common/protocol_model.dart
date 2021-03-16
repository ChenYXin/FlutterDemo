import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/utils/log_utils.dart';
import 'package:flutter_app/src/utils/navigator_utils.dart';

import 'common_webview.dart';

class ProtocolModel {
  TapGestureRecognizer _registerProtocolRecognizer;
  TapGestureRecognizer _privacyProtocolRecognizer;

  Future<bool> showProtocolFunction(BuildContext context) async {
    _registerProtocolRecognizer = TapGestureRecognizer();
    _privacyProtocolRecognizer = TapGestureRecognizer();

    bool isShow = await showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return cupertinoAlertDialog(context);
        });

    _registerProtocolRecognizer.dispose();
    _privacyProtocolRecognizer.dispose();

    return Future.value(isShow);
  }

  CupertinoAlertDialog cupertinoAlertDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("温馨提示"),
      content: Container(
        height: 120,
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: buildContent(context),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text("不同意"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        CupertinoDialogAction(
          child: Text("同意"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  buildContent(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "请仔细阅读",
            style: TextStyle(color: Colors.grey),
            children: [
          TextSpan(
            text: "<<用户协议>>",
            style: TextStyle(color: Colors.blue),
            recognizer: _registerProtocolRecognizer
              ..onTap = () {
                openUserProtocol(context);
              },
          ),
          TextSpan(
            text: "与",
            style: TextStyle(color: Colors.grey),
          ),
          TextSpan(
            text: "<<隐私协议>>",
            style: TextStyle(color: Colors.blue),
            recognizer: _privacyProtocolRecognizer
              ..onTap = () {
                openPrivacyProtocol(context);
              },
          ),
          TextSpan(
            text:
                "*******kj圣诞节阿拉基调奥四季豆拿手机哦你说的解耦爱神的箭哦你按时计算机都还爱上地哦啊搜ID极爱哦是的囧按实际哦还扫地阿杰噢四等奖爱哦收到收到啊熬时间都还阿斯加德欧艾斯黛搜到*kj圣诞节阿拉基调奥四季豆拿手机哦你说的解耦爱神的箭哦你按时计算机都还爱上地哦啊搜ID极爱哦是的囧按实际哦还扫地阿杰噢四等奖爱哦收到收到啊熬时间都还阿斯加德欧艾斯黛搜到*kj圣诞节阿拉基调奥四季豆拿手机哦你说的解耦爱神的箭哦你按时计算机都还爱上地哦啊搜ID极爱哦是的囧按实际哦还扫地阿杰噢四等奖爱哦收到收到啊熬时间都还阿斯加德欧艾斯黛搜到*kj圣诞节阿拉基调奥四季豆拿手机哦你说的解耦爱神的箭哦你按时计算机都还爱上地哦啊搜ID极爱哦是的囧按实际哦还扫地阿杰噢四等奖爱哦收到收到啊熬时间都还阿斯加德欧艾斯黛搜到*",
            style: TextStyle(color: Colors.grey),
          )
        ]));
  }

  void openUserProtocol(BuildContext context) {
    LogUtils.e("查看用户协议");
    NavigatorUtils.pagePush(
      context: context,
      targetPage: CommonWebViewPage(
        pageTtle: "用户协议",
        htmlUrl:
            'https://space.bilibili.com/513480210/channel/detail?cid=163044',
      ),
    );
  }

  void openPrivacyProtocol(BuildContext context) {
    LogUtils.e("查看隐私协议");

    NavigatorUtils.pagePush(
      context: context,
      targetPage: CommonWebViewPage(
        pageTtle: "隐私协议",
        htmlUrl:
        'https://pub.flutter-io.cn/packages/webview_flutter/install',
      ),
    );
  }
}
