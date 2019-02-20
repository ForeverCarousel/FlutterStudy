import 'package:flutter/material.dart';
import '../Common/wechat_constant.dart' show WechatColors,WechatIcons;
import 'wechat_recent_session.dart' show WechatRecentSession,WechatRecentSessionPageData;

// import 'package:pull_to_refresh/pull_to_refresh.dart';

//popup item的事件美剧
enum WechatHomePopmenuAction {
  HOME_CHAT_GROUP,HOME_ADD_FRIEND,HOME_SACN,HOME_PAYMENT
}

class WechatHomePage extends StatefulWidget {
  _WechatHomePageState createState() => _WechatHomePageState();
}

class _WechatHomePageState extends State<WechatHomePage> {
  List<Widget> listCells = List();
  List<WechatRecentSession> listSession = WechatRecentSessionPageData.mockSessionList;
  @override
  void initState() {
    for (var i = 0; i < listSession.length; i++) {
      WechaHomeListCell cell = WechaHomeListCell(session: listSession[i]);
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
        elevation: 0.0,//取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
        actions: <Widget>[
           _buildPopmenuBtn()
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(2.0),
        // itemExtent: 60.0,
        itemBuilder: (BuildContext context, int index){
          WechaHomeListCell cell = listCells[index];
          return cell;
        },
        itemCount: listCells.length,
      ),
    );
  }

  PopupMenuButton _buildPopmenuBtn(){
    return PopupMenuButton(
      icon: Icon(IconData(0xe644,fontFamily: WechatIcons.WechatIconFontFamily)),
      offset: Offset(0, 60.0),
      onSelected: (index){
        print(index);
      },
      itemBuilder:(BuildContext context){
        return <PopupMenuEntry<WechatHomePopmenuAction>>[//PopupMenuItem继承自PopupMenuEntry
            PopupMenuItem(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(IconData(0xe601,fontFamily: WechatIcons.WechatIconFontFamily),color:const Color(WechatColors.WechatAppbarMenuTextColor),),
                    Container(width: 16,),
                    Text('开始群聊',style: TextStyle(color: const Color(WechatColors.WechatAppbarMenuTextColor)))
                  ],
                ),
                value: WechatHomePopmenuAction.HOME_CHAT_GROUP,
                
              ),
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(IconData(0xe6ce,fontFamily: WechatIcons.WechatIconFontFamily),color: const Color(WechatColors.WechatAppbarMenuTextColor)),
                  Container(width: 16,),
                  Text('添加好友',style: TextStyle(color: const Color(WechatColors.WechatAppbarMenuTextColor)))
                ],
              ),
              value: WechatHomePopmenuAction.HOME_ADD_FRIEND,
            ) ,
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(IconData(0xe68a,fontFamily: WechatIcons.WechatIconFontFamily),color: const Color(WechatColors.WechatAppbarMenuTextColor),),
                  Container(width: 16,),
                  Text('扫一扫',style: TextStyle(color: const Color(WechatColors.WechatAppbarMenuTextColor)))
                ],
              ),
              value: WechatHomePopmenuAction.HOME_SACN,
            ),
            PopupMenuItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(IconData(0xe658,fontFamily: WechatIcons.WechatIconFontFamily),color: const Color(WechatColors.WechatAppbarMenuTextColor)),
                    Container(width: 16,),
                    Text('收付款',style: TextStyle(color: const Color(WechatColors.WechatAppbarMenuTextColor)))
                  ],
                ),
                value: WechatHomePopmenuAction.HOME_PAYMENT,
              )
        ];
      } ,
    );
  }
}

//首页cell
class WechaHomeListCell extends StatefulWidget {
  WechaHomeListCell({
    this.session
  }):assert(session !=null);
  final WechatRecentSession session;

  _WechaHomeListCellState createState() => _WechaHomeListCellState(session: this.session);
}

class _WechaHomeListCellState extends State<WechaHomeListCell> {
  _WechaHomeListCellState({
    this.session
  }):assert(session !=null);

  final WechatRecentSession session;

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (this.session.isAvatarFromNet()) {
      avatar = Image.network(session.avatar,width: 48,height: 48);
    }else{
      avatar =Image.asset(session.avatar,width: 48,height: 48);
    }
    var rightWidget = <Widget>[
      Text(session.time,style: TextStyle(fontSize: 12.0,color: Color(0xff9e9e9e))),
      SizedBox(height: 10.0),
    ];
    if (this.session.enableMute) {//-,- 以后再加先做主要结构
      // muteIcon =Icon(i)
    }

    return Container(//cell的整体一个container 内部全局是一个row 分为左中右三部分 其中中间和右侧又是两个coloum
      // width: 400,
      // height: 80,
      padding: EdgeInsets.only(left: 12.0, top: 10.0, right: 12.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(
          width: 0.2,color: Colors.grey
        ))
      ),
      // color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(//给头像组建设置圆角 包一层
            borderRadius: BorderRadius.circular(4.0),
            child: avatar,
          ),
          Container(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(session.title,style: TextStyle(fontSize: 14,color: Colors.black)),
                Text(session.content,maxLines: 1,style: TextStyle(fontSize: 12,color: Colors.grey))
              ],
            ),
          ),
          Container(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(session.time,style: TextStyle(fontSize: 11.0,color: Color(0xff9e9e9e))),
              // Icon(Icons.ring_volume)
            ],
          )
        ],
      )
    );
  }
}