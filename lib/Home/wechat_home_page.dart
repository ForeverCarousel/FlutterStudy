import 'package:flutter/material.dart';
import '../Common/wechat_constant.dart' show WechatColors,WechatIcons;
// import 'package:pull_to_refresh/pull_to_refresh.dart';

enum WechatHomePopmenuAction {
  HOME_CHAT_GROUP,HOME_ADD_FRIEND,HOME_SACN,HOME_PAYMENT
}

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
           PopupMenuButton(
            icon: Icon(Icons.add),
            offset: Offset(0, 60),
            itemBuilder:(BuildContext context){
              return <PopupMenuEntry<WechatHomePopmenuAction>>[
                  PopupMenuItem(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(IconData(0xe601,fontFamily: WechatIcons.WechatIconFontFamily)),
                          Text('开始群聊')
                        ],
                      ),
                      value: WechatHomePopmenuAction.HOME_CHAT_GROUP,
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(IconData(0xe6ce,fontFamily: WechatIcons.WechatIconFontFamily)),
                          Text('添加好友')
                        ],
                      ),
                      value: WechatHomePopmenuAction.HOME_ADD_FRIEND,
                    ) ,
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(IconData(0xe68a,fontFamily: WechatIcons.WechatIconFontFamily)),
                          Text('扫一扫')
                        ],
                      ),
                      value: WechatHomePopmenuAction.HOME_SACN,
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(IconData(0xe658,fontFamily: WechatIcons.WechatIconFontFamily)),
                          Text('收付款')
                        ],
                      ),
                      value: WechatHomePopmenuAction.HOME_PAYMENT,
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