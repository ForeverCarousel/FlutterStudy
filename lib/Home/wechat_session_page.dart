import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'session_bottom_toolbar.dart' show SessionBottomToolbar;

class WechatSessionPage extends StatelessWidget {
  final String title;
  WechatSessionPage({Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(this.title,style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold , color: Colors.black)),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            color: Colors.black,
            onPressed: (){},
          )
        ],
      ),
      backgroundColor: Color(0xffebebeb),
      body: SafeArea(
        child:  Column(//分为两部分 第一部分是回话内容list 第二部分是输入框控件
          children: <Widget>[
            Divider(height: 0.5,color: Color(0xffebebeb)),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
            SessionBottomToolbar()
          ],
        ),
      )
    );
  }
}