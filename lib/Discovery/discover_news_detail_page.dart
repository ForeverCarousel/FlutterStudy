import 'package:flutter/material.dart';
import 'discovery_news.dart';


class DiscoverNewsDetailPage extends StatefulWidget {
  final  MovieModel movieModel;

  DiscoverNewsDetailPage({Key key, this.movieModel}) : super(key: key);

  _DiscoverNewsDetailPageState createState() => _DiscoverNewsDetailPageState();
}

class _DiscoverNewsDetailPageState extends State<DiscoverNewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.movieModel.movieName,style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold , color: Colors.black)),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xffebebeb),
      body: Center(
        child: Text('详情页面'),
      ),
    );
  }
}