import 'package:flutter/material.dart';

/**
 * InheritedWidget 状态共享 Provider
 * 可共享 数据、事件等
 */

class CounterProvider extends InheritedWidget {
  // CounterProvider({Key key, this.child}) : super(key: key, child: child);

  //
  final Widget child;
  final int count;
  final VoidCallback setCount;

  //构造函数
  CounterProvider(
    this.count,
    this.setCount,
    this.child,
  );

  // 通过该方法可以访问Provider （InheritedWidgetDemo）中的内容
  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  // 当状态改变时，是否重新渲染控件
  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class InheritedWidgetDemo extends StatefulWidget {
  InheritedWidgetDemo({Key key, this.title = '没使用 InheritedWidget 的状态共享'})
      : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InheritedWidgetDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '您已多次按下按钮：',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );

    // return new CounterProvider(
    //   count: _counter,
    //   setCount: _incrementCounter,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text(widget.title),
    //     ),

    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           Text(
    //             '您已多次按下按钮：',
    //           ),
    //           Text(
    //             '$_counter',
    //             style: Theme.of(context).textTheme.headline4,
    //           ),
    //         ],
    //       ),
    //     ),

    //     floatingActionButton: FloatingActionButton(
    //       onPressed: _incrementCounter,
    //       tooltip: 'Increment',
    //       child: Icon(Icons.add),
    //     ),
    //   ),
    // );
  }
}
