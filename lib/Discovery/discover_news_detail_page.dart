import 'package:flutter/material.dart';
import 'discovery_news.dart';
import 'package:flutter/animation.dart';



class DiscoverNewsDetailPage extends StatefulWidget {
  final  MovieModel movieModel;

  DiscoverNewsDetailPage({Key key, this.movieModel}) : super(key: key);

  _DiscoverNewsDetailPageState createState() => _DiscoverNewsDetailPageState();
}

class _DiscoverNewsDetailPageState extends State<DiscoverNewsDetailPage> with SingleTickerProviderStateMixin{

  Animation<double> _scaleAnimation;
  AnimationController _saController;

  @override
  void initState() {
    super.initState();
    _saController = AnimationController(duration: const Duration(milliseconds: 600),vsync: this);
    
    CurvedAnimation curveAnimation = CurvedAnimation(
      parent: _saController,
      curve: Curves.bounceInOut,
      reverseCurve: Curves.easeInOutBack
    );
    _scaleAnimation = Tween(begin: 0.0, end: 500.0).animate(curveAnimation)..addListener((){
                      setState(() {});
                      })..addStatusListener((status) {
                        if (status == AnimationStatus.completed) {
                          _saController.reverse();
                        } else if (status == AnimationStatus.dismissed) {
                          _saController.forward();
                        }
                      }
                        
                      );
    _saController.forward();
  }

  @override
  void dispose() {
    _saController.dispose();
    super.dispose();
  }

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
        child: Image.asset(
          'assets/images/user_avatar.png',
          width: _scaleAnimation.value,
          height: _scaleAnimation.value,
        ),
      ),
    );
  }
}