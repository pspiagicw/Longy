import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  String name;

  NameWidget({Key? key , required this.name}) : super(key: key);


  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(2.0),
      child: Text(
        name,
        style: TextStyle(
          fontFamily: 'BreamCatcher',
          color: Colors.blue,
          fontSize: 25.0,
        )
      )
    );
  }
}
