import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'wechat_root_container.dart';
import 'Common/wechat_constant.dart' show WechatColors;
/*
runApp方法需要传入一个widget类型的对象 一般传入 MaterialApp 谷歌MD设计规范风格 CupertinoApp 苹果设计规范
风格 以及自定义的 WidgetsApp 前两者相较于后者主要是增加了对应风格所需要的组件属性 比如color theme等
三者都是如下继承关系：
  StatefulWidget -> Widget -> DiagnosticableTree -> Diagnosticable
实际上MaterialApp和CupertinoApp都可以理解为基于WidgetsApp定制的widegt 文档中也描述了：
MaterialApp:This class creates an instance of [WidgetsApp].
*/
void main() => runApp(WechatApp());

class WechatApp extends StatelessWidget {//runapp方法需要传入一个Widget类型的组件 可以理解为一个app的对象
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      title: "微信",
      theme: ThemeData.light().copyWith(
        cardColor:Color(WechatColors.WechatAppbarColor) 
        // cardColor:Colors.white
      ),
      // routes: null,
      home:WechatRootContainer()
    );
  }
  
}


