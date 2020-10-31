import 'package:flutter/material.dart';

import 'package:app_ui/navs/NavsScreen.dart';
import 'package:app_ui/info/InfoScreen.dart';


class MineScreen extends StatefulWidget {
  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('个人中心'),
        centerTitle: true,
      ),

      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              RaisedButton(
                child: Text('一个凸起的材质矩形按钮'),
                onPressed: () {
                  print('这是按扭的点击事件！');
                },
              ),

              RaisedButton(
                child: Text('Flutter导航的使用'),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (centext) {
                      return NavsScreen();
                    },
                  ),);
                },
              ),

              RaisedButton(
              child: Text('动态跳转，可带参数 这个用得多'),
              onPressed: () {
                Navigator.push(context, 
                  new MaterialPageRoute(builder: (context) {
                    return InfoScreen(name:'沐枫', age: 28);
                  }),
                );
              }
            ),
            ],
          ),
        ),
      ),

      drawer: new Drawer(
        child: Center(
          child: Text('个人设置'),
        ),
      ),
    );
  }
}
