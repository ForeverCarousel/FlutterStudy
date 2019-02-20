import 'package:flutter/material.dart';
import 'package:hello_flutter/Common/wechat_constant.dart' show WechatColors;

class WechatContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(WechatColors.WechatAppbarColor),
        title: Text("联系人"),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
      ),
      body: Center(
        child: Text("这是联系人页面，待开发"),
      ),
    );
  }
}