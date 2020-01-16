
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ThirdState();
  }

}

class ThirdState extends State<ThirdWidget>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Third Activity"),
      ),
      body: Center(
        child: Text("Body of a goddess"),
      ),
    );
  }
}