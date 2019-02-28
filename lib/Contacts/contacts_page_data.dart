import 'package:flutter/material.dart';

class Contact {
  const Contact({
    this.avatar,
    this.name,
    this.nameIndex,
    this.onPressed
  }):assert(avatar != null),
    assert(name != null);

  final String avatar;
  final String name;
  final String nameIndex;
  final VoidCallback onPressed;
}


class ContactsPageData {

  //功能区数据
  final List<Contact> functionContacts = [
    Contact(
      avatar: 'assets/images/ic_new_friend.png',
      name: '新的朋友',
      onPressed: () { print('添加新朋友。'); }
    ),
    Contact(
      avatar: 'assets/images/ic_group_chat.png',
      name: '群聊',
      onPressed: () { print('点击了群聊。'); }
    ),
    Contact(
      avatar: 'assets/images/ic_tag.png',
      name: '标签',
      onPressed: () { print('标签。'); }
    ),
    Contact(
      avatar: 'assets/images/ic_public_account.png',
      name: '公众号',
      onPressed: () { print('添加公众号。'); }
    ),
  ];
  //联系人数据
  final List<Contact> contactsList = [
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/53.jpg',
      name: 'Maurice Sutton',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/76.jpg',
      name: 'Jerry',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/17.jpg',
      name: 'Dangdang',
      nameIndex: 'D',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/55.jpg',
      name: 'Teddy',
      nameIndex: 'T',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/11.jpg',
      name: 'Steave',
      nameIndex: 'S',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
      name: 'Vivian',
      nameIndex: 'V',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/50.jpg',
      name: 'Mary',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/91.jpg',
      name: 'David',
      nameIndex: 'D',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
      name: 'Bob',
      nameIndex: 'B',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/60.jpg',
      name: 'Jeff Green',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/45.jpg',
      name: 'Adam',
      nameIndex: 'A',
    ),
     const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/33.jpg',
      name: 'Alinna',
      nameIndex: 'A',
    ),
     const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/77.jpg',
      name: 'Anna Hefier',
      nameIndex: 'A',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/7.jpg',
      name: 'Michel',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/35.jpg',
      name: 'Green',
      nameIndex: 'G',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/64.jpg',
      name: 'Jack Ma',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/men/86.jpg',
      name: 'Tom',
      nameIndex: 'T',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/45.jpg',
      name: 'Kdam',
      nameIndex: 'K',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/75.jpg',
      name: 'Sichel',
      nameIndex: 'S',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/35.jpg',
      name: 'Nereen',
      nameIndex: 'N',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/64.jpg',
      name: 'Lack Ma',
      nameIndex: 'L',
    ),
    const Contact(
      avatar: 'https://randomuser.me/api/portraits/women/86.jpg',
      name: 'Xeom',
      nameIndex: 'X',
    ),
     const Contact(
      avatar: 'http://img3.duitang.com/uploads/item/201412/10/20141210170630_ZzFsN.png',
      name: '高圆圆',
      nameIndex: 'G',
    ),
    const Contact(
      avatar: 'http://images.liqucn.com/img/h1/h972/img201709221452570_info300X300.jpg',
      name: '陈奕迅',
      nameIndex: 'C',
    ),
  ];

  static List<Contact> mockData() {
    List<Contact> list =ContactsPageData().contactsList;
    list.sort((left,right) => left.nameIndex.compareTo(right.nameIndex));
    //第一种胖括号语法的完整表达方式如下
    // list.sort((left,right){
    //   return left.nameIndex.compareTo(right.name);
    // });

    return list;
  }

  static List<Contact> mockFunctionData() {
    return ContactsPageData().functionContacts;
  }
  
}