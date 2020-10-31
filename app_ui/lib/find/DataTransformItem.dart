import 'package:flutter/material.dart';

import 'package:app_ui/find/DataTransform.dart';

class DataTransformItem extends StatelessWidget {
  final DataTransform item;

  DataTransformItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      padding: EdgeInsets.all(12),
      child: Card(
        // 阴影效果
        elevation: 10,

        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only( left: 15.0, right: 15.0, top: 20.0, bottom: 10),
                  child: Image.network(
                    item.logo,
                    width: 60.0,
                    height: 60.0,
                  ),
                ),
                Container(
                  width: 160,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 0.0,
                      right: 10.0,
                      bottom: 5.0,
                    ),
                    child: Text(
                      // item.location.substring( 0, item.location.length > 6 ? 6 : item.location.length),
                      item.name,
                      style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                    left: 5.0,
                    right: 10.0,
                    bottom: 5.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "| 版本：" + item.version,
                        style: TextStyle(fontSize: 14.0, color: Colors.green, height: 2),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "| 评分：" + item.rating + '💙',
                        style: TextStyle(fontSize: 14.0, color: Colors.blue, height: 2),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "| 类型：" + item.tag,
                        style: TextStyle(fontSize: 14.0, color: Colors.purple, height: 2),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                    left: 15.0,
                    right: 10.0,
                    bottom: 15.0,
                  ),
                  child: new Text(
                      "下载次数：" + item.hot + "，  文件大小：" + item.size.toString()  + "MB",
                      style: new TextStyle(fontSize: 15.0, color: Colors.grey)),
                ),
                // new Padding(
                //   padding: EdgeInsets.only(bottom: 8),
                //   child: Icon(Icons.access_alarm, color: Colors.grey),
                // ),
                Expanded(
                  child: Column( crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(bottom: 8, right: 5),
                      child: Icon(Icons.chevron_right, color: Colors.blue),
                    ),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
