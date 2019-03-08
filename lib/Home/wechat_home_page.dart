import 'package:flutter/material.dart';
import '../Common/wechat_constant.dart' show WechatColors, WechatIcons;
import 'wechat_recent_session.dart' show WechatRecentSession, WechatRecentSessionPageData;
import 'wechat_session_page.dart';

// import 'package:pull_to_refresh/pull_to_refresh.dart';

//popup item的事件美剧
enum WechatHomePopmenuAction {
  HOME_CHAT_GROUP,
  HOME_ADD_FRIEND,
  HOME_SACN,
  HOME_PAYMENT
}

//首页
class WechatHomePage extends StatefulWidget {
  _WechatHomePageState createState() => _WechatHomePageState();
}
class _WechatHomePageState extends State<WechatHomePage> {
  List<Widget> listCells = List(); //cell数组
  List<WechatRecentSession> listSession =
      WechatRecentSessionPageData.mockSessionList; //列表数据

  @override
  void initState() {
    for (var i = 0; i < listSession.length; i++) {
      WechaHomeListCell cell = WechaHomeListCell(
        session: listSession[i],
        clickCallback: (TapUpDetails detail) {
          print("点击了第${i+1}行");
          _jumpToSessionPage(this.listSession[i].title);        
        },
      );
      listCells.add(cell);
    }
    super.initState();
  }

  //跳转页面
  void _jumpToSessionPage(String title){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return WechatSessionPage(title: title);
        }
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(WechatColors.WechatAppbarColor),
        backgroundColor: Colors.white,
        title: Text("微信",style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold , color: Colors.black)),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
        actions: <Widget>[_buildPopmenuBtn()],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(2.0),
        // itemExtent: 60.0,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _buildListHeader();
          }else{
            WechaHomeListCell cell = listCells[index - 1];
            return cell;
          }       
        },
        itemCount: listCells.length + 1,
      ),
    );
  }
  //构建右上角pop按钮
  PopupMenuButton _buildPopmenuBtn() {
    return PopupMenuButton(
      // icon:Icon(IconData(0xe65e, fontFamily: WechatIcons.WechatIconFontFamily)),
      icon: Icon(
          IconData(
          0xe658,
          fontFamily: WechatIcons.WechatIconFontFamily),
          size: 20.0,
          color: Colors.black54
      ),
      offset: Offset(0, 60.0),
      onSelected: (index) {
        print(index);
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<WechatHomePopmenuAction>>[
          //PopupMenuItem继承自PopupMenuEntry
          PopupMenuItem( 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(IconData(
                  0xe69e,
                  fontFamily: WechatIcons.WechatIconFontFamily),
                  color: const Color(WechatColors.WechatAppbarMenuTextColor),
                ),
                SizedBox(
                  width: 16,
                ),
                Text('发起群聊',style: TextStyle(color: const Color(WechatColors.WechatAppbarMenuTextColor)))
              ],
            ),
            value: WechatHomePopmenuAction.HOME_CHAT_GROUP,
          ),
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                    IconData(0xe638,
                        fontFamily: WechatIcons.WechatIconFontFamily),
                    color: const Color(WechatColors.WechatAppbarMenuTextColor)
                ),
                SizedBox(
                  width: 16,
                ),
                Text('添加好友',
                    style: TextStyle(
                        color: const Color(
                            WechatColors.WechatAppbarMenuTextColor)))
              ],
            ),
            value: WechatHomePopmenuAction.HOME_ADD_FRIEND,
          ),
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  IconData(0xe61b,
                      fontFamily: WechatIcons.WechatIconFontFamily),
                  color: const Color(WechatColors.WechatAppbarMenuTextColor),
                ),
                SizedBox(
                  width: 16,
                ),
                Text('扫一扫',
                    style: TextStyle(
                        color: const Color(
                            WechatColors.WechatAppbarMenuTextColor)))
              ],
            ),
            value: WechatHomePopmenuAction.HOME_SACN,
          ),
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                    IconData(0xe62a,
                        fontFamily: WechatIcons.WechatIconFontFamily),
                    color: const Color(WechatColors.WechatAppbarMenuTextColor)),
                SizedBox(
                  width: 16,
                ),
                Text('收付款',
                    style: TextStyle(
                        color: const Color(
                            WechatColors.WechatAppbarMenuTextColor)))
              ],
            ),
            value: WechatHomePopmenuAction.HOME_PAYMENT,
          )
        ];
      },
    );
  }
  //构建多端在线的header
  Widget _buildListHeader() {
    return Container(
      padding: EdgeInsets.only(left: 12.0, top: 10.0, right: 12.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2, color: Colors.grey
          ),
        ),
        color: Color(0xfff5f5f5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(IconData(
            0xe640,
            fontFamily: WechatIcons.WechatIconFontFamily
          ), size: 24.0, color: Color(0xff606062)),
          Container(width: 16.0),
          Text('Mac 微信已登录，手机通知已关闭。', style: TextStyle(fontSize: 13,color: Color(0xff606062))),
        ],
      ),
    );
  }
}

//首页cell
typedef HomeCellClickFunc = void Function(TapUpDetails detail); //定义回调方法类型
class WechaHomeListCell extends StatefulWidget {
  WechaHomeListCell({
    this.session,
    this.clickCallback
  }) : assert(session != null);

  final WechatRecentSession session;
  final HomeCellClickFunc clickCallback;

  _WechaHomeListCellState createState() =>
      _WechaHomeListCellState(session: this.session,clickCallback: this.clickCallback);
}
class _WechaHomeListCellState extends State<WechaHomeListCell> {
  _WechaHomeListCellState({
    this.session,
    this.clickCallback
  }) : assert(session != null);

  final HomeCellClickFunc clickCallback;
  final WechatRecentSession session;

  @override
  Widget build(BuildContext context) {
    Widget _avatar;//包含了未读消息数widget
    Widget unreadIcon =session.unreadMsgCount > 0 ? UnreadDotIcon(count: session.unreadMsgCount) : Container(width: 19,height: 19);
    if (this.session.isAvatarFromNet()) {
      _avatar = Stack(
        overflow: Overflow.visible,//不要剪切超出部分的视图
        alignment: Alignment.topRight,
        children: <Widget>[
          ClipRRect(
            //给头像组建设置圆角 包一层
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(session.avatar, width: 48, height: 48),
          ),
          Positioned(
            child: unreadIcon,
            top: -6.0,
            right: -6.0,
          )
        ],
      ); 
    } else {
      _avatar = ClipRRect(
            //给头像组建设置圆角 包一层
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(session.avatar, width: 48, height: 48),
        );
    }
    //暂时用透明色来控制静音icon的显示和隐藏
    Color _muteIconColor = Colors.grey;
    if (!this.session.enableMute) {
      _muteIconColor = Colors.transparent;
    }
    List<Widget> _rightWidget = <Widget>[
      Text(session.time, style: TextStyle(fontSize: 12.0, color: Color(0xff9e9e9e))),
      SizedBox(height: 10.0),
      Icon(
        IconData(0xe755,fontFamily: WechatIcons.WechatIconFontFamily),
        color: _muteIconColor,
        size: 16,
      )
    ];
    
    Container _buildCell() {//提取方法 避免嵌套过多
      return Container(
          //cell的整体一个container 内部全局是一个row 分为左中右三部分 其中中间和右侧又是两个coloum
          padding: EdgeInsets.only(left: 12.0, top: 10.0, right: 12.0, bottom: 10.0),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.2, color: Colors.grey))),
          // color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _avatar,
              Container(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(session.title,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    Container(height: 5),
                    Text(session.content,
                        maxLines: 1,
                        style: TextStyle(fontSize: 13, color: Colors.grey))
                  ],
                ),
              ),
              Container(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _rightWidget
              )
            ],
          ));
    }

    return GestureDetector(
      //包一层手势用于点击事件
      child: _buildCell(),
      onTapUp: (TapUpDetails detail) {
        this.clickCallback(detail);//回调点击事件到listview层
      },
    );
  }
}

//未读角标组件
class UnreadDotIcon extends StatelessWidget {
  UnreadDotIcon({
    this.count
  });
  final int count;
  final double sizeH = 19.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeH,
      height: sizeH,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(sizeH/2)
      ),
      alignment: Alignment.center,
      child: Text(this.count.toString() ,style: TextStyle(color: Colors.white,fontSize: 11),textAlign: TextAlign.center,),    
    );
  }
}

//静音组件
class MuteIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
