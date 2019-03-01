import 'package:flutter/material.dart';
import 'package:hello_flutter/Common/wechat_constant.dart' show WechatColors;
import 'wechat_standard_cell.dart';

class WechatDiscoveryPage extends StatelessWidget {
  static const SEPARATE_SIZE = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("发现",style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold , color: Colors.black)),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
      ),
      backgroundColor: Color(0xffebebeb),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 1.0),
            WechatStandardCell(
              iconPath: 'assets/images/ic_social_circle.png',
              title: '朋友圈',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            WechatStandardCell(
              iconPath: 'assets/images/ic_quick_scan.png',
              title: '扫一扫',
              showDivider: true,
              onPressed: () {
                print('点击了扫一扫');
              },
            ),
            Divider(indent: 50.0,height: 1.0,color: Color(0xffd9d9d9)),
            WechatStandardCell(
              iconPath: 'assets/images/ic_shake_phone.png',
              title: '摇一摇',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            WechatStandardCell(
              iconPath: 'assets/images/ic_feeds.png',
              title: '看一看',
              showDivider: true,
              onPressed: () {},
            ),
            Divider(indent: 50.0,height: 1.0,color: Color(0xffd9d9d9)),
            WechatStandardCell(
              iconPath: 'assets/images/ic_quick_search.png',
              title: '搜一搜',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            WechatStandardCell(
              iconPath: 'assets/images/ic_people_nearby.png',
              title: '附近的人',
              showDivider: true,
              onPressed: () {},
            ),
            Divider(indent: 50.0,height: 1.0,color: Color(0xffd9d9d9)),
            WechatStandardCell(
              iconPath: 'assets/images/ic_bottle_msg.png',
              title: '漂流瓶',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            WechatStandardCell(
              iconPath: 'assets/images/ic_shopping.png',
              title: '购物',
              showDivider: true,
              onPressed: () {},
            ),
            Divider(indent: 50,height: 1.0,color: Color(0xffd9d9d9)),
            WechatStandardCell(
              iconPath: 'assets/images/ic_game_entry.png',
              title: '游戏',
              onPressed: () {},
            ), 
            SizedBox(height: SEPARATE_SIZE),
            WechatStandardCell(
              iconPath: 'assets/images/ic_mini_program.png',
              title: '小程序',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
          ],
          
        ),
      ),
    );
  }
}


