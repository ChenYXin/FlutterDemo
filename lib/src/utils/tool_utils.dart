import 'package:flutter/services.dart';

class ToolUtils{
  static void closeApp(){
    SystemChannels.platform.invokeMethod("SystemNavigator.pop");
  }
}