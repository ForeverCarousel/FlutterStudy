import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

//http://api.douban.com/v2/movie/top250?start=0&count=1 豆瓣开放API
class DiscoveryNewsPage extends StatefulWidget {
  final Widget child;

  DiscoveryNewsPage({Key key, this.child}) : super(key: key);

  _DiscoveryNewsPageState createState() => _DiscoveryNewsPageState();
}

class _DiscoveryNewsPageState extends State<DiscoveryNewsPage> {
  final int _currentPage = 1;
  final int _queryDataCount = 250;
  List<MovieModel> listData = List();

  _requestData() async {
    HttpClient client = HttpClient();//生成一个client对象 用于管理请求
    String urlStr = 'http://api.douban.com/v2/movie/top250?start=$_currentPage&count=$_queryDataCount';
    Uri uri = Uri.parse(urlStr);//生成URL
    HttpClientRequest request = await client.getUrl(uri);//生成request对象
    HttpClientResponse response = await request.close();//异步等待请求结果 返回数据为HttpClientResponse对象
    if (response.statusCode == HttpStatus.ok) {
       List<MovieModel> tempListData = List();
      var responseBody = await response.transform(utf8.decoder).join();//异步线程解析成json数据
      Map<String, dynamic> result =json.decode(responseBody);//解码jason生成基本数据类型 具体类型由接口返回数据确定此处为一个map
      List movieData =result['subjects'];//获取电影数据
      // movieData.map((item) {//遍历生成模型 加入到数据源 以下方法为最基本的手动解析 纯粹用于基础知识学习 三方库会提供很多自动解析的功能 以后再研究
      //   String movieName =item['title'];
      //   String imageUrl =item['images']['small'];
      //   MovieModel model =MovieModel(movieName: movieName,imageURL: imageUrl);
      //   tempListData.add(model);
      // });
      for (var i = 0; i < movieData.length; i++) {
        var item =movieData[i];
        String movieName =item['title'];
        String imageUrl =item['images']['small'];
        MovieModel model =MovieModel(movieName: movieName,imageURL: imageUrl);
        tempListData.add(model); 
      }

      setState(() {
        this.listData =tempListData;
       print('书信页面'); 
      });
      print('数据请求成功,数据个数:${listData.length}');
    }else{
      print('数据请求失败');
    }

  }

  @override
  void initState() {
    _requestData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('电影推荐', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black)),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(icon: 
          Icon(Icons.refresh),
          color: Colors.black,
          onPressed: (){
            _requestData();
          },)
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(5.0),
        scrollDirection: Axis.vertical,
        itemCount: listData == null? 0 : this.listData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1),
        itemBuilder: (BuildContext context, int index) {
          return _GridTile(model: this.listData[index]);
        },
      ),
    );
  }
}

//电影数据模型
class MovieModel {
  MovieModel(
      {this.imageURL,
      this.movieName,
      this.directorName,
      this.actorName,
      this.movieType,
      this.date,
      this.briefInfo});

  final String imageURL;
  final String movieName;
  final String directorName;
  final String actorName;
  final String movieType;
  final String date;
  final String briefInfo;
}

//网格列表的cell 其实就是UIKit collectionview的cell
class _GridTile extends StatelessWidget {
  _GridTile({Key key, this.model});

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(
            this.model.imageURL,
            fit: BoxFit.fitWidth,
            width: 195.0,
            height: 150.0,
          ),
          SizedBox(height: 5,),
          Text(this.model.movieName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
