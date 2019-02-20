import 'package:flutter/material.dart';

class WechatRecentSession {
  
  const WechatRecentSession({
    @required this.avatar,
    @required this.title,
    this.titleColor = 0xffffffff,
    this.content,
    this.time,
    this.enableMute = false,
    this.unreadMsgCount = 0
  }): assert (avatar != null),
      assert (title != null),
      super();

  final String avatar;
  final String title;
  final String content;
  final int titleColor;
  final String time;
  final bool enableMute;
  final int unreadMsgCount;

  bool isAvatarFromNet() {
    if(this.avatar.indexOf('http') == 0 || 
      this.avatar.indexOf('https') == 0) {
      return true;
    }
    return false;
  }
}


class WechatRecentSessionPageData {
  WechatRecentSessionPageData({
    this.sessionList
  }):assert(sessionList !=null),
    super();

  final List<WechatRecentSession> sessionList;

  static List<WechatRecentSession> mockSessionList = [
    const WechatRecentSession(
      avatar: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
      content: '',
      time: '19:56',
    ),
    const WechatRecentSession(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      content: '这是一条假新闻,纯粹是用来假装这个看起来像真新闻的',
      time: '17:20',
    ),
    const WechatRecentSession(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      content: '25元现金助力开学季！',
      time: '17:12',
    ),
    const WechatRecentSession(
      avatar: "https://randomuser.me/api/portraits/women/1.jpg",
      title: '汤姆丁',
      content: '今晚要一起去吃肯德基吗？',
      time: '17:56',
      enableMute: true,
      unreadMsgCount: 0,
    ),
    const WechatRecentSession(
      avatar: 'https://randomuser.me/api/portraits/women/5.jpg',
      title: 'Tina Morgan',
      content: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      time: '17:58',
      enableMute: false,
      unreadMsgCount: 3,
    ),
    const WechatRecentSession(
      avatar: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
      titleColor: 0xff586b95,
      content: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      time: '17:12',
    ),
    const WechatRecentSession(
      avatar: 'https://randomuser.me/api/portraits/women/7.jpg',
      title: 'Lily',
      content: '今天要去运动场锻炼吗？',
      time: '昨天',
      enableMute: false,
      unreadMsgCount: 99,
    ),
    const WechatRecentSession(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      content: '今晚要一起去吃肯德基吗？',
      time: '17:56',
      enableMute: true,
      unreadMsgCount: 0,
    ),
    const WechatRecentSession(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      content: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      time: '17:58',
      enableMute: false,
      unreadMsgCount: 3,
    ),
    const WechatRecentSession(
      avatar: 'https://randomuser.me/api/portraits/women/15.jpg',
      title: 'Lily',
      content: '今天要去运动场锻炼吗？',
      time: '昨天',
      enableMute: false,
      unreadMsgCount: 0,
    ),
    const WechatRecentSession(
      avatar: 'https://randomuser.me/api/portraits/men/20.jpg',
      title: '汤姆丁',
      content: '今晚要一起去吃肯德基吗？',
      time: '17:56',
      enableMute: true,
      unreadMsgCount: 0,
    ),
    const WechatRecentSession(
      avatar: 'https://randomuser.me/api/portraits/women/22.jpg',
      title: 'Tina Morgan',
      content: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      time: '17:58',
      enableMute: false,
      unreadMsgCount: 1,
    ),
    const WechatRecentSession(
      avatar: 'https://randomuser.me/api/portraits/women/77.jpg',
      title: 'Lily',
      content: '今天要去运动场锻炼吗？',
      time: '昨天',
      enableMute: false,
      unreadMsgCount: 0,
    ),
  ];
}