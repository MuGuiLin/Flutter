import 'package:app_ui/info/InfoScreen.dart';
import 'package:flutter/material.dart';

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

      body: Container(
        child: new Column(
            children: <Widget>[
              RaisedButton(
                child: Text('一个凸起的材质矩形按钮'),
                onPressed: (){
                  print('这是按扭的点击事件！');
                },
              ),

              RaisedButton(
                child: Text('静态跳转'),
                onPressed: () {
                  // Navigator.of(context).pushNamed('/info').then((value) => {
                  //   print(value)
                  // }),
                }
              ),

              RaisedButton(
                child: Text('动态跳转 到 新路由'),
                onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return InfoScreen();
                  }),
                );
              })
            ]
        )
      ),

      drawer: new Drawer(
        child: Center(
          child: Text('个人设置'),
        ),
      ),
    );
  }
}
