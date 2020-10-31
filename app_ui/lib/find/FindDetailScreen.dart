import 'package:flutter/material.dart';

class FindDetailScreen extends StatefulWidget {
  FindDetailScreen({Key key}) : super(key: key);

  @override
  _FindDetailScreenState createState() => _FindDetailScreenState();
}

class _FindDetailScreenState extends State<FindDetailScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox.fromSize(
                  size: Size.fromHeight(256.0),
                  // child: Indic
                )
            ],
            )
          )
        ],
      ),
    );
  }
}
