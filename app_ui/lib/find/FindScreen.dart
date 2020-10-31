import 'dart:io';

import 'package:flutter/material.dart';

//utf8
import 'dart:convert';

// 第三方 Flutter 获取网络数据 插件 起别名为 http
import 'package:http/http.dart' as http;

import 'package:app_ui/find/DataTransform.dart';
import 'package:app_ui/find/DataTransformItem.dart';
import 'package:app_ui/find/FindInfoScreen.dart';

class FindScreen extends StatefulWidget {
  @override
  _FindScreenState createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  // 存储获取网络数据数组
  List<DataTransform> dataList = [];

  // 上接分页加载页码
  int page = 1;

  // ListView中的控制器 可用于监听滚动事件
  ScrollController listViewScrollController = ScrollController();

  // Flutter 原生获取网络数据 get方法
  getNetWorkData(String url) async {
    print(url);

    // 实例化网络请求对象
    HttpClient http = new HttpClient();

    // 异步 请求
    HttpClientRequest request = await http.getUrl(Uri.parse(url));
    // 异步 返回请求响应结果
    HttpClientResponse response = await request.close();

    // 异步 通过uft8 解码
    var data = await response.transform(utf8.decoder).join();

    print('\n原生获取网络数据：' + data);

    if(200 == response.statusCode) {
      // jsonDecode(data)['list'].isEmpty 判断是否是一个空数组
      if (page > 1 && jsonDecode(data)['list'].isEmpty) {
        print('别扯啦，到底啦！我是有底线的！分页没有数据啦！');

      } else {
        setState(() {
          if(1 == page) {
            dataList = DataTransform.formJson((data));
          } else {
            // 追加数组
            dataList.addAll(DataTransform.formJson((data)));
          }
        
        });
      }
    }

    // 请求结束，关闭链接
    http.close();
  }

  // 第三方 Flutter 获取网络数据 插件  https://pub.dev/packages/http 注：安装只需在 pubspec.yaml 中添加 http: ^0.12.2 即可
  getData(String url) async {
    var response = await http.get(url);
    var data = response.body;
    print('\n第三方获取网络数据：' + data);

    setState(() {
      // dataList = DataTransform.formJson((data));
      // 追加数组
      dataList.addAll(DataTransform.formJson((data)));
    });
  }

  @override
  void initState() {
    super.initState();

    String url = 'http://m.app.haosou.com/index/getData?type=1&page=1';

    getNetWorkData(url);

    // getData(url);

    // 绑定滚动监听事件 注：该方法必须写在initState()初始化方法中！
    listViewScrollController.addListener(() {
      // print('OK 滚动了！');

      // 判断是否滚动到底部了 => 当前滚动距离 等于 最大滚动距离 时就触发 分页加载动作
      if (listViewScrollController.position.pixels == listViewScrollController.position.maxScrollExtent) {
        print('OK 滚动到底部了');
        setState(() {
          // page = page + 1;
          page = ++page;
        });

        //String url = 'http://m.app.haosou.com/index/getData?type=1&page=' + page.toString(); // toString() 数值 转换成 字符串   int.parse('1234') 把字符串 1234 转换成 数值     double.parse('1234.12');  //把字符串 1234.12 转换成 数值 1234.12
        String url = 'http://m.app.haosou.com/index/getData?type=1&page=$page';
        getNetWorkData(url);
        // getData(url);
      }
    });
  }

  // 上拉刷新事件
  Future<void> onRefresh() async {
    // 延时3秒
    await Future.delayed(Duration(seconds: 3), () {
      print('刷新了！');
       setState(() {
        // page = page + 1;
        page = 1;
      });
      
      String url = 'http://m.app.haosou.com/index/getData?type=1&page=$page';
      getNetWorkData(url);
    });
  }

  // 刚进页面时，如果还在网络请求就显示 加载中的动画，否则就显列表内容
  Widget isContent() {
    if (dataList.isEmpty) {
      return new Center(
        child: CircularProgressIndicator(),
      );
    } else {
      // RefreshIndicator 刷新控件
      return new RefreshIndicator(
          child: new ListView.builder(
            controller: listViewScrollController,
            itemBuilder: (context, index) {
              var item = dataList[index];
              return InkWell(
                // child: Text(item.name),
                child: DataTransformItem(item),
                onTap: () {
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) {
                      return FindInfoScreen();
                    }),
                  ).then((value) => null);
                },
              );
            },
            itemCount: dataList.length,
          ),
          onRefresh: onRefresh);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('网络请求，下拉刷新，上拉加载'),
        centerTitle: true,
      ),

      // body: ListView.builder(
      //   controller: listViewScrollController,
      //   itemBuilder: (context, index) {
      //     var item = dataList[index];
      //     return InkWell(
      //       // child: Text(item.name),
      //       child: DataTransformItem(item),
      //       onTap: () {
      //         // Navigator.push(context, route);
      //       },
      //     );
      //   },
      //   itemCount: dataList.length,
      // ),

      body: isContent(),
    );
  }
}
