import 'package:flutter/material.dart';
import 'discovery_news.dart';
import 'package:flutter/animation.dart';

class DiscoverNewsDetailPage extends StatefulWidget {
  final MovieModel movieModel;

  DiscoverNewsDetailPage({Key key, this.movieModel}) : super(key: key);

  _DiscoverNewsDetailPageState createState() => _DiscoverNewsDetailPageState();
}

class _DiscoverNewsDetailPageState extends State<DiscoverNewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebebeb),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: (){Navigator.of(context).pop();},
            ),
            // title: Text("12345",style: TextStyle(color: Colors.black)),
            centerTitle: true,
            expandedHeight: 270,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(widget.movieModel.movieName,style: TextStyle(color: Colors.white)),
              // centerTitle: true,
              background: Image.network(
                widget.movieModel.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          
          ),
          
        ],
      )
    );
  }
}
