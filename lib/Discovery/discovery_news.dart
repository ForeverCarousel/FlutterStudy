import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DiscoveryNewsPage extends StatefulWidget {
  final Widget child;

  DiscoveryNewsPage({Key key, this.child}) : super(key: key);

  _DiscoveryNewsPageState createState() => _DiscoveryNewsPageState();
}

class _DiscoveryNewsPageState extends State<DiscoveryNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('电影推荐',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold , color: Colors.black)),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
        ),
      )
    );
  }
}