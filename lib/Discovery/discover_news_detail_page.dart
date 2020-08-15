import 'package:flutter/material.dart';
import 'discovery_news.dart';

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
            floating: false,
            // snap: true,
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.orange,
              onPressed: (){Navigator.of(context).pop();},
            ),
            title: Text(widget.movieModel.movieName,style: TextStyle(color: Colors.black)),
            centerTitle: true,
            expandedHeight: 270,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.movieModel.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildListDelegate(
              [
                Text('1'),
                Text('2'),
                Text('3'),
                Text('4'),
                Text('5'),
                Text('6'),
                Text('7'),
                Text('8'),
                Text('9'),
                Text('10'),
                Text('11'),
                Text('12'),

              ]
            ),
          )
        ],
      )
    );
  }
}
