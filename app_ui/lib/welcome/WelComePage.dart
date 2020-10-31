import 'dart:async';

import 'package:app_ui/main.dart';
import 'package:flutter/material.dart';

class WelComePage extends StatefulWidget {
  @override
  _WelComePageState createState() => _WelComePageState();
}

class _WelComePageState extends State<WelComePage> {
  // 倒计时 3秒
  int counter = 4;

  // 定时器对象
  Timer _timer;

  void goMain() {
    // 跳转至Main页面 并 删除当前页(因为这个页面只在启动APP时才会用到)
    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) {
        
        return Main();
    }), (route) => false);
  }


  // 初始化方法
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /**
     * 定时器 Timer
     * 
     * Duration()类型
     * //             天            时               分               秒                毫秒                   微秒
     * Duration({int days = 0, int hours = 0, int minutes = 0, int seconds = 0, int milliseconds = 0, int microseconds = 0})
     * 
     */
    // 定时器 Timer  seconds: 1 => 每隔1秒执行一次
    _timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      if (1 == counter) {
        _timer.cancel(); // 清除定时器
        _timer = null;

        // 3秒后 跳转到Main()页面
        goMain();
      } else {
        // 执行倒计时
        setState(() {
          counter = --counter;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    // 获取屏幕尺寸
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final topStatusBarHeight = MediaQuery.of(context).padding.top; //顶部安全距离(状态栏高度)
    final bottomAppBarHeight = MediaQuery.of(context).padding.bottom; //底部安全距离(状态栏高度)

    return Scaffold(
      // appBar: new AppBar(
      //   title: Text('欢迎页(启动页)'),
      //   centerTitle: true,
      // ),

      body: new Stack(
        children: <Widget>[
          new Container(
            child: Image.asset(
              'assets/images/welcome.jpg',
              width: screenWidth,
              height: screenHeight,
              fit: BoxFit.cover,
            ),
          ),

          
          new Positioned(
            top: topStatusBarHeight + 15,
            right: 20,
            // child: Text(
            //   '$counter',
            //   style: TextStyle(fontSize: 56, color: Colors.blue),
            // ),

            child: Chip(
              label: RichText(
                text: new TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '启动中 >>>',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),

                    TextSpan(
                      text:  ' $counter ',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),

                    TextSpan(
                      text: '秒后打开!',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    )
                  ],
                ),
              ),
              backgroundColor: Colors.transparent
            )
          )
        ],
      ),
    );
  }
}
