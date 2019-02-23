import 'package:flutter/material.dart';
import 'package:hello_flutter/Common/wechat_constant.dart' show WechatColors;
import 'contacts_page_data.dart' show Contact, ContactsPageData;

/* 
 页面的内容全部有model层ContactsPageData驱动 有些地方的数据初始化由于不太熟悉dart的语法后续还需要优化 cxl_2019.02.22  
*/
class WechatContactPage extends StatefulWidget {
  _WechatContactPageState createState() => _WechatContactPageState();
}

class _WechatContactPageState extends State<WechatContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(WechatColors.WechatAppbarColor),
        title: Text("联系人"),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
      ),
      body: ContactList(
        contactsListData: ContactsPageData.mockData(),
        functionListData: ContactsPageData.mockFunctionData(),
        ),
    );
  }
}

//构建联系人列表
class ContactList extends StatelessWidget {
  final List<Contact> contactsListData;
  final List<Contact> functionListData;

  ContactList({
    @required this.contactsListData,
    @required this.functionListData
  }):assert(contactsListData != null);
  
  //联系人cells
  final List _contactItems = List<_ContactItem>();
  //顶部功能区cells
  final List _functionItems = List<_ContactItem>();//由于和联系人cell的样式相同 所以这里复用就行了
  
  @override
  Widget build(BuildContext context) {
    //构建联系人cells
    for (var i = 0; i < this.contactsListData.length; i++) {
      _ContactItem item = _ContactItem(contact: this.contactsListData[i]);
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
      itemBuilder: (BuildContext context, int index){
        //分区构建
        if (index < this._functionItems.length) {
          return _functionItems[index];
        }else{
          return _contactItems[index-_functionItems.length];
        }
      },
      itemCount: this.contactsListData.length,
    );
  }
}

//联系人item
class _ContactItem extends StatelessWidget {
  final Contact contact;
  _ContactItem({
    this.contact,
  }):assert(contact != null);
  
  @override
  Widget build(BuildContext context) {
    Image _avatar;
    if (this.contact.avatar.startsWith('http') || this.contact.avatar.startsWith('https')) {
      _avatar =Image.network(this.contact.avatar,width: 36.0,height: 36.0);
    }else{
      _avatar =Image.asset(this.contact.avatar,width: 36.0,height: 36.0);
    }

    return Container(
      margin: const EdgeInsets.only(left: 16,right: 0.0),//修改的是自己距离父容器的编剧 这里可以理解为cell的宽度被修改了
      padding: const EdgeInsets.symmetric(vertical: 10.0),//这里修改的是cell中子控件的显示范围 这里是指的cell中的子控件距离上边边距都为10
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.2,color: Color(0xff888888))
        )
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: _avatar,
          ),
          
          SizedBox(width: 10,),
          Text(
            this.contact.name,
            style:TextStyle(fontSize: 14,
            color: Colors.black)
          ),
           
        ],
      ),
    );
  }
}