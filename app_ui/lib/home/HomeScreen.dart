import 'package:flutter/material.dart';

import 'package:app_ui/web/WebViewScreen.dart';

import 'package:app_ui/home/InheritedWidgetDemo.dart';
import 'package:app_ui/home/InheritedWidgetDemo1.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('首页'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: [
            RaisedButton(
              child: Text('WebView的使用'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (centext) {
                      return WebViewScreen();
                    },
                  ),
                );
              },
            ),

            RaisedButton(
              child: Text('没有 InheritedWidget 状态共享'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (centext) {
                      return InheritedWidgetDemo1();
                    },
                  ),
                );
              },            
            ),

            RaisedButton(
              child: Text('有 InheritedWidget 状态共享'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (centext) {
                      return InheritedWidgetDemo();
                    },
                  ),
                );
              },            
            ),

            Container(
              child: Text('666'),
              color: Colors.red,
            ),
          ],
        )));
  }
}
