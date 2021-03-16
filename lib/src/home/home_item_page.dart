import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'list_item_widget.dart';

class HomeItemPage extends StatefulWidget {
  final int flag;

  HomeItemPage(this.flag);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeItemPageState();
  }
}

class _HomeItemPageState extends State<HomeItemPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return ListViewItemWidget();
          },
        ),
      ),
    );
  }
}
