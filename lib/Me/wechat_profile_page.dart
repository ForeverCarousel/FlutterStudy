import 'package:flutter/material.dart';

import '../Discovery/wechat_standard_cell.dart';

class WechatProfilePage extends StatelessWidget {
  static const SEPARATE_SIZE = 10.0;
  //顶部个人卡片
  Widget _infoCard() {
    return Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/user_avatar.png', width: 60, height: 60),
          SizedBox(width: 15.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('陈奕迅',style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('微信号:Eason Chan'),
              ],
            ),
          ),
          // Icon(Icons.camera,color: Colors.grey,size: 24),
          Image.asset('assets/images/ic_qrcode_preview_tiny.png',width: 24.0,height: 24.0),
          SizedBox(width: 5),
          Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 15,)
        ],
      ),
    );
  }

  //整体widgets数组
  List<Widget> _columItems() {
    return [
      _infoCard(),
      SizedBox(height: SEPARATE_SIZE),
      WechatStandardCell(
        iconPath: 'assets/images/ic_wallet.png',
        title: '支付',
        onPressed: () {},
      ),
      SizedBox(height: SEPARATE_SIZE),
      WechatStandardCell(
        iconPath: 'assets/images/ic_collections.png',
        title: '收藏',
        showDivider: true,
        onPressed: () {
          print('收藏');
        },
      ),
      Divider(indent: 50.0, height: 1.0, color: Color(0xffd9d9d9)),
      WechatStandardCell(
        iconPath: 'assets/images/ic_album.png',
        title: '相册',
        onPressed: () {},
      ),
      Divider(indent: 50.0, height: 1.0, color: Color(0xffd9d9d9)),
      WechatStandardCell(
        iconPath: 'assets/images/ic_cards_wallet.png',
        title: '卡包',
        showDivider: true,
        onPressed: () {},
      ),
      Divider(indent: 50.0, height: 1.0, color: Color(0xffd9d9d9)),
      WechatStandardCell(
        iconPath: 'assets/images/ic_emotions.png',
        title: '表情',
        onPressed: () {},
      ),
      SizedBox(height: SEPARATE_SIZE),
      WechatStandardCell(
        iconPath: 'assets/images/ic_settings.png',
        title: '设置',
        onPressed: () {},
      ),
      SizedBox(height: SEPARATE_SIZE),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text("我",style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold , color: Colors.black)),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
        actions: <Widget>[
          Icon(
            Icons.camera_alt,
            color: Colors.black,
          ),
          SizedBox(width: 15)
        ],
      ),
      backgroundColor: Color(0xffebebeb),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: _columItems()),
      ),
    );
  }
}
