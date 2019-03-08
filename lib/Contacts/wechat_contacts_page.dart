import 'package:flutter/material.dart';
import 'contacts_page_data.dart' show Contact, ContactsPageData;
import '../Common/wechat_constant.dart' show WechatIcons;

/* 
 页面的内容全部有model层ContactsPageData驱动 有些地方的数据初始化由于不太熟悉dart的语法后续还需要优化 cxl_2019.02.22  
*/
class WechatContactPage extends StatefulWidget {
  _WechatContactPageState createState() => _WechatContactPageState();
}

class _WechatContactPageState extends State<WechatContactPage> {
  //生成索引数组
  final Set<String> _indexLetters = Set<String>();
  Color _indexBarColor = Colors.transparent;
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < ContactsPageData.mockData().length; i++) {
      _indexLetters.add(ContactsPageData.mockData()[i].nameIndex);
    }
    double _indexItemH = 300.0 / _indexLetters.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("联系人",style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold , color: Colors.black)),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
            IconData(0xe638, fontFamily: WechatIcons.WechatIconFontFamily),
            color: Colors.black54,
            size: 26.0,
            ),
            onPressed: (){},
          ),          
          // SizedBox(width: 15)
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.centerEnd, //右侧indexbar居中显示
        children: <Widget>[
          ContactList(
            contactsListData: ContactsPageData.mockData(),
            functionListData: ContactsPageData.mockFunctionData(),
            controller: _controller,
          ),
          Positioned(
            right: 0.0,
            width: 24,
            height: 300,
            child: GestureDetector(
                child: Container(
                  color: _indexBarColor,
                  child: _IndexBar(data: List.from(_indexLetters)),
                ),
                onVerticalDragDown: (DragDownDetails details) {
                  setState(() {
                    _indexBarColor = Colors.black26;
                  });
                },
                //indexbar的总高度为300 内部的item的总个数为_indexLetters.length 可以计算出每个占据的高度
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  if (details.globalPosition.dy <= 350) {
                    double deltaY = details.globalPosition.dy;
                    int currentIndex = deltaY ~/ _indexItemH;
                    print('position ====== $currentIndex');
                  }
                  
                },
                onVerticalDragEnd: (DragEndDetails details) {
                  setState(() {
                    _indexBarColor = Colors.transparent;
                  });
                },
                onVerticalDragCancel: () {
                  setState(() {
                    _indexBarColor = Colors.transparent;
                  });
                },
              )
          )
        ],
      )
    );
  }
}

//构建联系人列表
class ContactList extends StatelessWidget {
  final List<Contact> contactsListData;
  final List<Contact> functionListData;
  final ScrollController controller;
  ContactList(
      {@required this.contactsListData,
      @required this.functionListData,
      this.controller})
      : assert(contactsListData != null);

  //联系人cells
  final List _contactItems = List<_ContactItem>();
  //顶部功能区cells
  final List _functionItems = List<_ContactItem>(); //由于和联系人cell的样式相同 所以这里复用就行了

  @override
  Widget build(BuildContext context) {
    //构建联系人cells
    for (var i = 0; i < this.contactsListData.length; i++) {
      bool _needHeader = true;
      //如果第下一个的nameIndex 和当前不一样则增加一个header
      if (i >= 1 && this.contactsListData[i].nameIndex == this.contactsListData[i - 1].nameIndex) {
        _needHeader = false;
      }
      _ContactItem item = _ContactItem(
        contact: this.contactsListData[i],
        needHeader: _needHeader
      );
      _contactItems.add(item);
    }
    //构建功能区cells
    for (var i = 0; i < this.functionListData.length; i++) {
      _ContactItem item = _ContactItem(contact: this.functionListData[i]);
      _functionItems.add(item);
    }

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(2.0),
      controller: this.controller,
      itemBuilder: (BuildContext context, int index) {
        //分区构建
        if (index < this._functionItems.length) {
          return _functionItems[index];
        } else {
          return _contactItems[index - _functionItems.length];
        }
      },
      itemCount: this.contactsListData.length + this.functionListData.length,
    );
  }
}

//联系人item
class _ContactItem extends StatelessWidget {
  final Contact contact;
  final bool needHeader;
  _ContactItem({this.contact, this.needHeader = false //默认不显示
      })
      : assert(contact != null);

  bool isNetImage() {
    if (this.contact.avatar.startsWith('http') ||
        this.contact.avatar.startsWith('https')) {
      return true;
    } else {
      return false;
    }
  }

  bool needSectionHeader() {
    return this.contact.nameIndex != null && this.needHeader;
  }

  //为了添加索引header cell区分为两种形式
  Widget _buildMainItem() {
    Image _avatar = this.isNetImage()
        ? Image.network(this.contact.avatar, width: 36.0, height: 36.0)
        : Image.asset(this.contact.avatar, width: 40.0, height: 40.0);
    Widget _rrAvatar = ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: _avatar,
    );
    return FlatButton(
      onPressed: (){},
      child: Container(
        margin: const EdgeInsets.only(left: 0.0, right: 0.0), //修改的是自己距离父容器的编剧 这里可以理解为cell的宽度被修改了
        padding: const EdgeInsets.symmetric(vertical: 10.0), //这里修改的是cell中子控件的显示范围 这里是指的cell中的子控件距离上边边距都为10
        decoration: BoxDecoration(border:Border(bottom: BorderSide(width: 0.2, color: Color(0xff888888)))),
        child: Row(
          children: <Widget>[
            _rrAvatar,
            SizedBox(width: 10),
            Text(this.contact.name,
                style: TextStyle(fontSize: 14, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _buildFixedItem() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 28.0,
          alignment: Alignment.centerLeft,
          color: Color(0xffebebeb),
          child: Text(
            this.contact.nameIndex != null ? this.contact.nameIndex : "",
            style: TextStyle(fontSize: 14.0, color: Color(0xff888888)),
          ),
        ),
        _buildMainItem()
      ],
    );
  }

  Widget _finalItme() {
    if (this.needSectionHeader()) {
      return _buildFixedItem();
    } else {
      return _buildMainItem();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _finalItme();
  }
}

//构建右侧indexbar
class _IndexBar extends StatelessWidget {
  _IndexBar({this.data});
  final List<String> data;

  List<Widget> _buildItems() {
    var listItems = List<Widget>();
    for (var i = 0; i < data.length; i++) {
      Text item = Text(
        this.data[i],
        style: TextStyle(fontSize: 14, color: Colors.black),
      );
      listItems.add(item);
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildItems());
  }
}
