import 'package:flutter/material.dart';

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
      body: Container(
        child: Text('666'),
        color: Colors.red,
      ),
    );
  }
}
