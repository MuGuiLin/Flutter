
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class DataFormat {

  final String logo;
  final String name;
  final String location;
  final String type;
  final String size;
  final String employee;
  final String hot;
  final String count;
  final String inc;

  // 构造函数
  DataFormat({
    @required this.logo,  // @required 必传字段
    @required this.name,
    @required this.location,
    this.type,
    this.size,
    this.employee,
    this.hot,
    this.count,
    this.inc,
  });

  // 静态方法 把格式化数据抽离成单的方法
  static DataFormat mapToData(Map map) {
    return new DataFormat(
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
  static List<DataFormat> returnDataFormatJsonString(String json) {
    List<DataFormat> listModel = new List<DataFormat>();

    List list = jsonDecode(json)['list'];

    // 格式化数据
    list.forEach((ele) {

      // var model = new DataFormat(
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

      var model = DataFormat.mapToData(ele);   // 调用上面的 mapToData 静态方法
      listModel.add(model);
    });

    return  listModel;
  }

  
}


// 测试 API GET方式：http://m.app.haosou.com/index/getData?type=1&page=1

// "list": [
//     {
//     "logo": "https://img.bosszhipin.com/beijin/mcs/chatphoto/20161230/b0df9f099f1d6db1937bc78068fb4c15760bb3f59f760cd45f5945e615392f6f.jpg",
//     "name": "杭州蚂蚁金服信息技术有限公司",
//     "location": "上海市浦东新区",
//     "type": "互联网",
//     "size": "B轮",
//     "employee": "10000人以上",
//     "hot": "资深产品工程师",
//     "count": "500",
//     "inc": "蚂蚁金融服务集团（以下称“蚂蚁金服”）起步于2004年成立的支付宝。2014年10月，蚂蚁金服正式成立。蚂蚁金服以“为世界带来微小而美好的改变”为愿景，致力于打造开放的生态系统，通过“互联网推进器计划”助力金融机构和合作伙伴加速迈向“互联网+”，为小微企业和个人消费者提供普惠金融服务。蚂蚁金服集团旗下及相关业务包括生活服务平台支付宝、智慧理财平台蚂蚁聚宝、云计算服务平台蚂蚁金融云、独立第三方信用评价体系芝麻信用以及网商银行等。另外，蚂蚁金服也与投资控股的公司及关联公司一起，在业务和服务层面通力合作，深度整合共推商业生态系统的繁荣。"
//   }
// ]