import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  // const WebViewScreen({Key key}) : super(key: key);

  WebViewController _webViewController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('WebView 网页'),
        centerTitle: true,
      ),

      body: new WebView(
        // initialUrl: 'https://smtmalltest.smgtech.net/',
        initialUrl: 'https://www.iqiyi.com/',

        // 是否执行js脚本 
        javascriptMode: JavascriptMode.unrestricted,

        // 执行js 脚本通道
        // javascriptChannels: jscode,

        // 创建界面
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },

        // 开始加载网页
        onPageStarted: (url) {
          print('开始加载网页：'+ url);
        },

        // 网页加载完成
        onPageFinished: (url) {
          print('网页加载完成：'+ url);
        },

        // 拦截网页相关URL
        // navigationDelegate: (navigation) {
        //   print('网页相关URL：' + navigation.url);
        // },
      ),
    );
  }
}