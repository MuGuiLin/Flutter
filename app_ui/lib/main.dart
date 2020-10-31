import 'package:flutter/material.dart';

import 'package:app_ui/welcome/WelComePage.dart';

import 'package:app_ui/home/HomeScreen.dart';
import 'package:app_ui/find/FindScreen.dart';
import 'package:app_ui/plan/PlanScreen.dart';
import 'package:app_ui/mine/MineScreen.dart';
import 'package:app_ui/navs/NavsScreen.dart';
import 'package:app_ui/info/InfoScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // home: Main(),

      // 欢迎页(启动页)
      home: WelComePage(),

      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new HomeScreen(),
        '/find': (BuildContext context) => new FindScreen(),
        '/plan': (BuildContext context) => new PlanScreen(),
        '/mine': (BuildContext context) => new MineScreen(),
        '/navs': (BuildContext context) => new NavsScreen(),
        '/info': (BuildContext context) => new InfoScreen(),
      },

    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  int activeIndex = 0;

  final List<Widget> bodyArr = [
    HomeScreen(),
    FindScreen(),
    PlanScreen(),
    MineScreen(),
  ];

  void onTapAction(int index){
    setState(() {
      activeIndex = index;
    });
  }
 
  List<BottomNavigationBarItem> itemArr = [
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/icons/home.png', width: 24, height: 24,),
      activeIcon: Image.asset('assets/images/icons/home_fill.png', width: 24, height: 24,),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      // icon: Image.asset('assets/images/icons/location.png', width: 24, height: 24,),
      // activeIcon: Image.asset('assets/images/icons/location_fill.png', width: 24, height: 24,), 
      // title: Text('定位')

      icon: Image.asset('assets/images/icons/circle.png', width: 24, height: 24,),
      activeIcon: Image.asset('assets/images/icons/circle_fill.png', width: 24, height: 24,), 
      title: Text('应用')
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/icons/job.png', width: 24, height: 24,),
      activeIcon: Image.asset('assets/images/icons/job_fill.png', width: 24, height: 24,),
      title: Text('求职')
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/icons/my.png', width: 24, height: 24,),
      activeIcon: Image.asset('assets/images/icons/my_fill.png', width: 24, height: 24,),
      title: Text('我的')
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: bodyArr[activeIndex],

      bottomNavigationBar: new BottomNavigationBar(
        items: itemArr,
        currentIndex: activeIndex,
        onTap: onTapAction,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        // type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}