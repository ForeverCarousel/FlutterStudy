import 'package:flutter/material.dart';

class SessionBottomToolbar extends StatelessWidget {
  SessionBottomToolbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      color: Color(0xffebebeb),
      padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 4.0, bottom: 4.0),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.keyboard_voice),
              iconSize: 25,
              color: Colors.black,
              onPressed: () {}),
          Expanded(
            child: TextField(
              cursorColor: Colors.green,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.insert_emoticon),
              iconSize: 30,
              padding: EdgeInsets.all(5),
              color: Colors.black54,
              onPressed: () {}
          ),
          IconButton(
              icon: Icon(Icons.add_circle_outline),
              iconSize: 30,
              padding: EdgeInsets.all(5),
              color: Colors.black54,
              onPressed: () {}    
          ),
        ],
      ),
    );
  }
}
