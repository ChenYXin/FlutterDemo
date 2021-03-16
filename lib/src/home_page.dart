import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home/home_item_page.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  // 当前
  int _currentIndex=0;
  PageController _pageController=new PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeItemPage(1),
            HomeItemPage(2),
            HomeItemPage(3),
            HomeItemPage(4),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value){
          setState(() {
            _currentIndex=value;
            _pageController.jumpToPage(value);
          });
        },
        currentIndex: _currentIndex,
        //显示文字
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.blue,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
        BottomNavigationBarItem(icon: Icon(Icons.dynamic_form),label: "发现"),
        BottomNavigationBarItem(icon: Icon(Icons.message),label: "信息"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "个人中心"),
      ],),
    );
  }

}