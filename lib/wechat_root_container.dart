import 'package:flutter/material.dart';
import 'Home/wechat_home_page.dart';
import 'Contacts/wechat_contacts_page.dart';
import 'Discovery/wechat_discovery_page.dart';
import 'Me/wechat_profile_page.dart';
import 'Common/wechat_constant.dart' show WechatIcons;
/*
此类的实例作为MaterialApp组件的Home属性 用于构建一个底部有TabBar 顶部有导航栏的容器组件
也可以理解为首页
打算写成以下结构：
app->..
    home->..
          scaffold->..
                    body: 第一个页面
                    bottomNavigationBar -> 四个页面的item
                     ..
          ..
    ..
*/

class WechatRootContainer extends StatefulWidget {
  _WechatRootContainerState createState() => _WechatRootContainerState();
}

class _WechatRootContainerState extends State<WechatRootContainer> {
  final List<Widget> _pagesList = List();
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> _itemsList = List();
  final List<String> _itemTitles = ["微信", "通讯录", "发现", "我"];
  final List<Icon> _itemIcons = [//这里通过使用自定义iconfont来生成图标
    Icon(IconData(0xe608,fontFamily: WechatIcons.WechatIconFontFamily)),
    Icon(IconData(0xe601,fontFamily: WechatIcons.WechatIconFontFamily)),
    Icon(IconData(0xe600,fontFamily: WechatIcons.WechatIconFontFamily)),
    Icon(IconData(0xe6c0,fontFamily: WechatIcons.WechatIconFontFamily)),
  ];
  final List<Icon> _itemIconsSelect = [//这里通过使用自定义iconfont来生成图标
    Icon(IconData(0xe603,fontFamily: WechatIcons.WechatIconFontFamily)),
    Icon(IconData(0xe656,fontFamily: WechatIcons.WechatIconFontFamily)),
    Icon(IconData(0xe671,fontFamily: WechatIcons.WechatIconFontFamily)),
    Icon(IconData(0xe626,fontFamily: WechatIcons.WechatIconFontFamily)),
  ];
  @override
  void initState() {
    _pagesList//构建四个子页面
      ..add(WechatHomePage())
      ..add(WechatContactsPage())
      ..add(WechatDiscoveryPage())
      ..add(WechatProfilePage());
    for (var i = 0; i < 4; i++) {//构建底部items
      BottomNavigationBarItem item = BottomNavigationBarItem(
        title: Text(_itemTitles[i]),
        icon: _itemIcons[i],
        activeIcon:_itemIconsSelect[i],
        backgroundColor: Colors.lightBlue,
      );
      _itemsList.add(item);
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pagesList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        items: _itemsList,
        currentIndex: _currentIndex,
        onTap: (int index) {//一个匿名函数的回调
          // print("当前点击的是：$index");
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
    
  }
}
