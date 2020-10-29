import 'package:flutter/material.dart';

import 'package:app_ui/plan/DataFormat.dart';

class DataFormatItem extends StatelessWidget {
  // const name({Key key}) : super(key: key);

  final DataFormat item;

  // 暗号：不用背 学规律！

  // 构造函数 接收参数
  DataFormatItem(this.item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(12),
      child: new Card(
        // 阴影效果
        elevation: 10,
        // 卡片内边距
        child: Padding(
          // padding: EdgeInsets.all(12),
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),   // 水平 和 垂直 
          child: new Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                new Container(
                    width: 240, height: 80,
                    child: new Row(
                      children: [
                        new Container(
                          width: 60, height: 60,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            // 圆角
                            borderRadius: BorderRadius.circular(6),
                            // 边框
                            border: Border.all(color: Colors.grey, width: 0.5),
                            image: DecorationImage(
                              // 网络图片
                              image: NetworkImage(item.logo),
                              // 显示方式（拉伸）
                              fit: BoxFit.cover)
                          ),
                        ),
                        new Container(
                          width: 160,

                          // child: Text(
                          //   item.location,
                          //   style: TextStyle(color: Colors.blue),
                          //   overflow: TextOverflow.ellipsis,   // 文本溢出后 显示...
                          // ),
                          child: Text(
                            item.location.substring(0, item.location.length > 6 ? 6 : item.location.length),   // 文本字符串截取
                            style: TextStyle(color: Colors.blue),
                          ),

                        )
                      ],
                    )),

                     new Column(

                       // 子元素主轴左对齐
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                      Text(
                        '| ' + item.type,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        '| ' + item.size,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text(
                        '| ' + item.employee,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.purple),
                      ),
                    ])
              ]),
              new Divider(color: Colors.grey),
              new Row(
                // 子元素两端对齐
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Text(
                  //   '热招：' + item.hot +' 等' + item.count + '个职位！',
                  //   style: TextStyle(color: Colors.red),
                  // ),

                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 10,
                      right: 5,
                      bottom: 15
                    ),
                    child: Text(
                      '热招：' + item.hot +' 等' + item.count + '个职位！',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),

                  Icon(Icons.navigate_next, size: 24, color: Colors.grey,),

                  // 把箭头向最右靠
                  Expanded(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget> [
                        Icon(Icons.navigate_next, size: 24, color: Colors.grey,),
                      ]
                    ), 
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
