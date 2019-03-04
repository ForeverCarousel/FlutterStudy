import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//http://api.douban.com/v2/movie/top250?start=0&count=1 豆瓣开放API
class DiscoveryNewsPage extends StatefulWidget {
  final Widget child;

  DiscoveryNewsPage({Key key, this.child}) : super(key: key);

  _DiscoveryNewsPageState createState() => _DiscoveryNewsPageState();
}

class _DiscoveryNewsPageState extends State<DiscoveryNewsPage> {
  final int currentPage = 1;
  final int 
  Future _requestData() async {
      String urlStr = 'http://api.douban.com/v2/movie/top250?start=0&count=1';
  }
 
  
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
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(5.0),
        scrollDirection: Axis.vertical,
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.5
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(child: Center(child: Text((index+1).toString())),color: Colors.lightBlue,) ;
        },
      ),
    );
  }
}