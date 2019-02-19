import 'package:flutter/material.dart';
import '../Common/wechat_constant.dart' show WechatColors;
// import 'package:pull_to_refresh/pull_to_refresh.dart';

class WechatHomePage extends StatefulWidget {
  _WechatHomePageState createState() => _WechatHomePageState();
}

class _WechatHomePageState extends State<WechatHomePage> {
  List<Widget> listCells = List();
  @override
  void initState() {
    for (var i = 0; i < 40; i++) {
      WechaHomeListCell cell = WechaHomeListCell();
      listCells.add(cell);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(WechatColors.WechatAppbarColor),
        title: Text("微信"),
        centerTitle: true,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: (){},
          // ),
           PopupMenuButton(
            icon: Icon(Icons.add),
            offset: Offset(0, 60),
            itemBuilder:(BuildContext context){
              return <PopupMenuEntry<String>>[
                  PopupMenuItem(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.add_circle),
                          Text('增加')
                        ],
                      ),
                      value: '这是增加',
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.remove_circle),
                          Text('减少')
                        ],
                      ),
                      value: '这是删除',
                    )
              ];
            } ,
          )
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(2.0),
        // itemExtent: 60.0,
        itemBuilder: (BuildContext context, int index){
          return listCells[index];
        },
        itemCount: listCells.length,
      ),
    );
  }
}

//首页cell
class WechaHomeListCell extends StatefulWidget {
  _WechaHomeListCellState createState() => _WechaHomeListCellState();
}

class _WechaHomeListCellState extends State<WechaHomeListCell> {
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      color: Colors.white,
      child: ListTile(
        title: Text("陈晓龙"),
        subtitle: Text("消息消息消息消息消息消息"),
        leading: Icon(Icons.person),
        trailing: Icon(Icons.navigate_next),
      )
    );
  }
}