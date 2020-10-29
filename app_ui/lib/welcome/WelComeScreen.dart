import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app_ui/home/HomeScreen.dart';

class WelComeScreen extends StatefulWidget {
  @override
  _WelComeScreenState createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<WelComeScreen> {
  int s = 3;
  // Timer _timer;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   _timer = new Timer.periodic(Duration(seconds: 3), () {
  //     print('object');
  //   });

  //   setState(() {
  //     s = --s;
  //   });
  // }

  // void goHomePage() {
  //   Navigator.pushAndRemoveUntil(
  //     MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
  //     ModalRoute.withName('/home'),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final topBarh = MediaQuery.of(context).padding.top;
    // final botBarh = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: new AppBar(
        title: Text('欢迎页（启动页）'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/images',
              width: screenWidth,
              height: screenHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: topBarh,
            child: Text('$s'),
          )
        ],
      ),
      drawer: new Drawer(
        child: Center(
          child: Text('个人设置'),
        ),
      ),
    );
  }
}
