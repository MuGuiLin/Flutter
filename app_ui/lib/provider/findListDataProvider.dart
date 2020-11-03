import 'package:flutter/material.dart';

import 'package:app_ui/find/DataTransform.dart';


/**
 * 全局状态共享 
 */
class FindListDataProvider with ChangeNotifier {
  // 存储获取网络数据数组
  // List<DataTransform> listData = [];

  List<DataTransform> _listData = new List();

  // 上接分页加载页码
  // int page = 1;
  int _listPage = 1;
  

  // 获取list数据方法
  List<DataTransform> get getDataList => _listData;

  // 获取分页页码方法
  int get listPage => _listPage;

  // 设置list数据方法(通过在调用时传过来的值 改变_dataList)
  set getDataList(List<DataTransform> data) {
    _listData = data;
  }

}