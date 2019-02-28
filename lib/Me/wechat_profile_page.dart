import 'package:flutter/material.dart';
import 'package:hello_flutter/Common/wechat_constant.dart' show WechatColors;
import 'dart:convert';
import 'package:http/http.dart' as http;


class WechatProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(WechatColors.WechatAppbarColor),
        title: Text("我"),
        elevation: 0.0, //取消bar底部material风格的滚动标示图产生的阴影
        centerTitle: true,
      ), 
      body: SampleAppPage(),
    );
  }
}


//ttttttt
class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          }));
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}")
    );
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}