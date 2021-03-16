class LogUtils {
  static bool _isLog = true;
  static String _longFlag = "Donkor - Log | ";

  static void init({bool isLog = false,String longFlag="Donkor - Log | "}) {
    _isLog = isLog;
  }

  static void e(String message) {
    if (_isLog) {
      print("$_longFlag $message");
    }
  }
}
