import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const double ImageRadio = 270/400.0; //这个比例是根据图片实际尺寸的比例;
//http://api.douban.com/v2/movie/top250?start=0&count=1 豆瓣开放API
class DiscoveryNewsPage extends StatefulWidget {
  final Widget child;

  DiscoveryNewsPage({Key key, this.child}) : super(key: key);

  _DiscoveryNewsPageState createState() => _DiscoveryNewsPageState();
}

class _DiscoveryNewsPageState extends State<DiscoveryNewsPage> {

  final int _currentPage = 1;
  final int _queryDataCount = 20;
  List<MovieModel> listData = List();
  bool isloading = false;//用于控制显示loading还是请求完成后显示表内容
//loading控件
  final _loadingProgress = Container(
      constraints: BoxConstraints.expand(),
      color: Colors.transparent,
      child: Center(
        child: SpinKitWave(
              color: Colors.lightBlue,
              size: 50.0,
        ),
      )
  );
//内容视图
  Widget _buildGridView() {
    double screenW =MediaQuery.of(context).size.width;
    double tileW = (screenW - 8*2 - 10)/2;//屏幕宽度减去两边padding再减去tile的间距 
    double tileH = tileW/ImageRadio + 20;//高度就是图片高度加上15文字的高度
    Size tileSize =Size(tileW, tileH);
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      scrollDirection: Axis.vertical,
      itemCount: listData == null? 0 : this.listData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: tileW/tileH, //这个比例是根据图片实际尺寸的比例
      ),
      itemBuilder: (BuildContext context, int index) {
        return _GridTile(model: this.listData[index],tileSize: tileSize);
      },
  );
  } 

//请求数据
  _requestData() async {
    setState(() {
      isloading = true;
    });
    HttpClient client = HttpClient();//生成一个client对象 用于管理请求
    String urlStr = 'http://api.douban.com/v2/movie/top250?start=$_currentPage&count=$_queryDataCount';
    Uri uri = Uri.parse(urlStr);//生成URL
    /*
     即使外部调用async方法 所有在await之后的方法都回在异步线程里串行执行 但是执行到await时该方法会立即返回
     函数调用栈会pop到外层方法继续执行
    */
    HttpClientRequest request = await client.getUrl(uri);//生成request对象
    HttpClientResponse response = await request.close();//异步等待请求结果 返回数据为HttpClientResponse对象
    if (response.statusCode == HttpStatus.ok) {
       List<MovieModel> tempListData = List();
      var responseBody = await response.transform(utf8.decoder).join();//异步线程解析成json数据
      Map<String, dynamic> result =json.decode(responseBody);//解码jason生成基本数据类型 具体类型由接口返回数据确定此处为一个map
      List movieData =result['subjects'];//获取电影数据
      for (var i = 0; i < movieData.length; i++) {//解析为数据模型
        var item =movieData[i];
        String movieName = item['title'];
        String imageUrl =item['images']['large'];
        MovieModel model =MovieModel(movieName: movieName,imageURL: imageUrl);
        tempListData.add(model); 
      }
      setState(() {
        isloading = false;
        this.listData =tempListData;
      });
    }else{
      setState(() {
        isloading = false;
      });
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
      backgroundColor: Color(0xffebebeb),
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
      body: this.isloading ? _loadingProgress : _buildGridView()
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

  _GridTile({Key key, this.model,this.tileSize});
  final MovieModel model;
  final Size tileSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            this.model.imageURL,
            fit: BoxFit.fill,
            width: this.tileSize.width,
            height: this.tileSize.height - 35,

          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              SizedBox(width: 5),
              Text(
                this.model.movieName,
                style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ]
          )

          
        ],
      ),
    );
  }
}
