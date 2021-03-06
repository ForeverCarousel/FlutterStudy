import 'package:flutter/material.dart';

class WechatStandardCell extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onPressed;
  final bool showDivider;
  WechatStandardCell({Key key,
    this.iconPath,
    this.title,
    this.onPressed,
    this.showDivider = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onPressed,
      // child:// Container(
      color: Colors.white,
      child: Container(
          padding: EdgeInsets.only(left: 0.0,right: 0.0,top: 16.0, bottom: 16.0),
          child: Row(
            children: <Widget>[
              Image.asset(this.iconPath,width: 24.0,height: 24.0,),
              SizedBox(width: 15),
              Expanded(
                child: Text(this.title,style: TextStyle(fontSize: 16)),
              ),
              Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14,)
            ],
          ),
      )
    );
  }
}