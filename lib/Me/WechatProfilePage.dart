import 'package:flutter/material.dart';

class WechatProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("这是个人页，待开发"),
      ),
    );
  }
}