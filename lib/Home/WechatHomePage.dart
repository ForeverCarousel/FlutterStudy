import 'package:flutter/material.dart';

class WechatHomePage extends StatefulWidget {
  _WechatHomePageState createState() => _WechatHomePageState();
}

class _WechatHomePageState extends State<WechatHomePage> {
  List<Widget> listCells = List();
  @override
  void initState() {
    for (var i = 0; i < 40; i++) {
      Text cell =Text("这是第${i}行");
      listCells.add(cell);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20.0),
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index){
          return listCells[index];
        },
        itemCount: listCells.length,
      ),
    );
  }
}