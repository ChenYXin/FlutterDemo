import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'index_page.dart';

class RootApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RootAppState();
  }
}

class _RootAppState extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return CupertinoApp();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}