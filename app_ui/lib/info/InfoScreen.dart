import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {

  //有状态控件的 构造函数 接收传来参数
  InfoScreen({Key key, this.name = '默认参数', this.age = 18}) : super(key: key);

  final String name;
  final int age;

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('二级页面 个人资料'),
        centerTitle: true,
      ),
      body: new Container(
        // padding: Padding.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('接收传过来的参数：' + widget.name + '， 年龄：' + widget.age.toString()),
              RaisedButton(
                child: Text('返回方式一 .pop()'),
                onPressed: () {
                  Navigator.of(context).pop('返回时 传过去的参数 666');
                },
              ),

              RaisedButton(
                child: Text('返回方式二 .popAndPushNamed()'),
                onPressed: () {
                  // 先从当前页退出（就是pop掉当前页），然后再进一个新页面
                  Navigator.of(context).popAndPushNamed('/mine');
                },
              ),

              RaisedButton(
                child: Text('返回方式三 '),
                onPressed: () {
                  // push一个页面进来，替换掉当前页面
                  Navigator.of(context).pushReplacementNamed('/mine');
                },
              ),
            ],
          ),
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
