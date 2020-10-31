import 'package:flutter/material.dart';

import 'package:app_ui/info/InfoScreen.dart';


class NavsScreen extends StatelessWidget {
  // const NavsScreen({Key key}) : super(key: key);

  final String _text = '导航的使用';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('导航的使用'),
        centerTitle: true,
      ),

      body: new  Center(
        
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('静态跳转，不带参数'),
              onPressed: () {
                Navigator.of(context).pushNamed('/info').then((value) => {
                  print('返回时 传来的参数：' + value)
                });
              }
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

            Text('$_text'),
        ],
        ),
      ),
    );
  }
}

