import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/common/permission_request_widget.dart';
import 'package:flutter_app/src/pages/common/protocol_model.dart';
import 'package:flutter_app/src/utils/log_utils.dart';
import 'package:flutter_app/src/utils/navigator_utils.dart';
import 'package:flutter_app/src/utils/tool_utils.dart';
import 'package:flutter_app/src/welcome_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sp_util/sp_util.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPageState();
  }
}

class _IndexPageState extends State with ProtocolModel {
  List<String> _list = ["第一次请求提示", "拒绝之后提示", "打开设置页面", "其他错误"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      initData();
      // NavigatorUtils.pagePushByFade(
      //   context: context,
      //   targetPage: PermissionRequestWidget(
      //     permission: Permission.storage,
      //     permissionList: _list,
      //     leftButtonMessage: "再考虑一下",
      //     isCloseApp: false,
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        "assets/images/ic_launcher.png",
        width: 66,
        height: 66,
      ),
    ));
  }

  void initData() {
    //当前应用运行在测试环境
    bool isLog = !bool.fromEnvironment("dart.vm.product");
    LogUtils.init(isLog: isLog);

    LogUtils.e("权限申请");
    NavigatorUtils.pagePushByFade(
        context: context,
        targetPage: PermissionRequestWidget(
          permission: Permission.storage,
          permissionList: _list,
          leftButtonMessage: "再考虑一下",
          isCloseApp: false,
        ),
        dismissCallBck: (value) {
          LogUtils.e("权限申请结果$value");

          initDataNext();
        });
  }

  void initDataNext() async {
    await SpUtil.getInstance();

    bool isAgreement = SpUtil.getBool("isAgreement");

    if (isAgreement == null || !isAgreement) {
      isAgreement = await showProtocolFunction(context);
    }

    if (isAgreement) {
      LogUtils.e("同意协议");

      SpUtil.putBool("isAgreement", true);

      next();
    } else {
      LogUtils.e("不同意协议");
      ToolUtils.closeApp();
    }
  }

  void next() {
    NavigatorUtils.pagePushByFade(
        context: context, targetPage: WelcomePage(), isReplace: true);
  }
}
