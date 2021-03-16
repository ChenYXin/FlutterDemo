import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/tool_utils.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRequestWidget extends StatefulWidget {
  final Permission permission;
  final List<String> permissionList;
  final bool isCloseApp;
  final String leftButtonMessage;

  PermissionRequestWidget(
      {@required this.permission,
      @required this.permissionList,
      this.leftButtonMessage = "再考虑一下",
      this.isCloseApp = false});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PermissionRequestState();
  }
}

class _PermissionRequestState extends State<PermissionRequestWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkPermission();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && _isGoSetting) {
      checkPermission();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
    );
  }

  void checkPermission({PermissionStatus status}) async {
    Permission permission = widget.permission;

    if (status == null) {
      status = await permission.status;
    }

    if (status.isGranted) {
      Navigator.of(context).pop(true);
    } else if (status.isDenied) {
      if (Platform.isIOS) {
        showAskPermissionDialog(widget.permissionList[0][2], "去设置", permission,
            isSetting: true);
        return;
      }
      showAskPermissionDialog(widget.permissionList[0], "同意", permission,isSetting: false);
    } else if (status.isPermanentlyDenied) {
      //第二次申请，拒绝
      showAskPermissionDialog(widget.permissionList[0][2], "去设置", permission,
          isSetting: true);
    }
  }

  bool _isGoSetting = false;

  void showAskPermissionDialog(
      String message, String rightMessage, Permission permission,
      {bool isSetting = false}) {
    showCupertinoDialog(
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("温馨提示"),
            content: Container(
              padding: EdgeInsets.all(12),
              child: Text(message),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text("${widget.leftButtonMessage}"),
                onPressed: () {
                  if (widget.isCloseApp)
                    // closeApp();
                  ToolUtils.closeApp();
                  else
                    Navigator.of(context).pop(false);
                },
              ),
              CupertinoDialogAction(
                child: Text("$rightMessage"),
                onPressed: () {
                  //关闭权限弹窗
                  Navigator.of(context).pop();
                  if (isSetting) {
                    _isGoSetting = true;
                    //去设置中心
                    openAppSettings();
                  } else {
                    //申请权限
                    requestPermission(permission);
                  }
                },
              )
            ],
          );
        },
        context: context);
  }

  // void closeApp() {
  //   SystemChannels.platform.invokeMethod("SystemNavigator.pop");
  // }

  void requestPermission(Permission permission) async {
    PermissionStatus permissionStatus = await permission.request();

    checkPermission(status: permissionStatus);
  }
}
