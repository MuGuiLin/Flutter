import 'dart:convert';

import 'package:flutter/cupertino.dart';

class DataTransform {
  final String logo;
  final String name;
  final String location;
  final String type;
  final double size;
  final String employee;
  final String hot;
  final String count;
  final String inc;
  final String tag;
  final String rating;
  final String version;

  // 构造函数
  DataTransform({
    @required this.logo, // @required 必传字段
    @required this.name,
    @required this.location,
    this.type,
    this.size,
    this.employee,
    this.hot,
    this.count,
    this.inc,
    this.tag,
    this.rating,
    this.version,
  });

  // 静态方法 把格式化数据抽离成单的方法
  static DataTransform formNetMap(Map map) {
    return new DataTransform(
      logo: map['logo_url'],
      name: map['name'],
      location: map['download_times_fixed'],
      type: map['type'],
      size: map['size_fixed'],
      employee: map['market_id'],
      hot: map['download_times_fixed'],
      count: map['cid2'],
      inc: map['baike_name'],
      tag: map['tag'],
      rating: map['rating'],
      version: map['version_name'],
    );
  }

  // 静态方法
  static List<DataTransform> formJson(String json) {
    List<DataTransform> listModel = new List<DataTransform>();

    // json格式转换
    List list = jsonDecode(json)['list'];

    // 格式化数据
    list.forEach((ele) {
      var model = DataTransform.formNetMap(ele); // 调用上面的 formMap 静态方法
      listModel.add(model);
    });

    return listModel;
  }

  // 静态方法 把格式化数据抽离成单的方法
  static DataTransform mapToData(Map map) {
    return new DataTransform(
      logo: map['logo'],
      name: map['name'],
      location: map['location'],
      type: map['type'],
      size: map['size'],
      employee: map['employee'],
      hot: map['hot'],
      count: map['count'],
      inc: map['inc'],
    );
  }

  // 静态方法
  static List<DataTransform> returnDataFormatJsonString(String json) {
    List<DataTransform> listModel = new List<DataTransform>();

    // json格式转换
    List list = jsonDecode(json)['list'];

    // 格式化数据
    list.forEach((ele) {
      // var model = new DataTransform(
      //   logo: ele['logo'],
      //   name: ele['name'],
      //   location: ele['location'],
      //   type: ele['type'],
      //   size: ele['size'],
      //   employee: ele['employee'],
      //   hot: ele['hot'],
      //   count: ele['count'],
      //   inc: ele['inc'],
      // );

      var model = DataTransform.mapToData(ele); // 调用上面的 mapToData 静态方法
      listModel.add(model);
    });

    return listModel;
  }
}
