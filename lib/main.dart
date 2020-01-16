import 'package:flutter/material.dart';
import 'strings.dart';
import 'homeflutter.dart';

void main() => runApp(GHFlutterApp());


class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Color(0xFFFFA700)),
      home: HomeFlutter(),
    );
  }
}




