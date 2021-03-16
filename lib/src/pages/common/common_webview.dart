import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonWebViewPage extends StatefulWidget {
  final String htmlUrl;
  final String pageTtle;

  CommonWebViewPage({@required this.htmlUrl, this.pageTtle = ""});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CommonWebViewPageState();
  }
}

class _CommonWebViewPageState extends State<CommonWebViewPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.pageTtle}"),
      ),
      backgroundColor: Colors.white,

      body: WebView(
        initialUrl: widget.htmlUrl,
      ),
    );
  }
}
