import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('个人资料'),
        centerTitle: true,
      ),

      body: Container(),

      drawer: new Drawer(
        child: Center(
          child: Text('个人设置'),
        ),
      ),
    );
  }
}
