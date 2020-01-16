import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'members.dart';
import 'strings.dart';
import 'memberwidget.dart';


class HomeFlutter extends StatefulWidget {
  @override
  createState() => HomeFlutterState();
}


class HomeFlutterState extends State<HomeFlutter> {

  var _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  var _padding = EdgeInsets.all(16.0);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: ListView.builder(
          itemCount: _members.length * 2,
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) return Divider();

            final index = position ~/ 2;

            return _buildRow(index);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addMember,
        backgroundColor: Color(0xFFFFA700),
        foregroundColor: Colors.black,
      ),
    );
  }

  _addMember() {
    setState(() {

    });
  }


  Widget _buildRow(int i) {
    return Padding(
        padding: _padding,
        child: ListTile(
          title: Text("${_members[i].login}", style: _biggerFont),
          leading: CircleAvatar(
              backgroundColor: Color(0xFFFFA700),
              backgroundImage: NetworkImage(_members[i].avatarUrl)
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            _pushMember(_members[i]);
          },
        )
    );
  }

  _loadData() async {

    http.Response response = await http.get(Strings.apiUrl);

    setState(() {
      final membersJSON = json.decode(response.body);

      for (var memberJSON in membersJSON) {
        final member = Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });

  }

  _pushMember(Member member) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MemberWidget(member)));
  }
}
