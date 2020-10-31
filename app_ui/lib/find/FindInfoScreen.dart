import 'package:flutter/material.dart';


class FindInfoScreen extends StatefulWidget {
  FindInfoScreen({Key key}) : super(key: key);

  @override
  _FindInfoScreenState createState() => _FindInfoScreenState();
}

class _FindInfoScreenState extends State<FindInfoScreen> {

  void saveData() async {
    
  }

  void readData() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        title: Text('详情页'),
      ),

      body: new Container(
        child: Text('Info'),
      ),
    );
  }
}