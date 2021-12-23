import 'package:flutter/material.dart';

class DiffWidget extends StatelessWidget {
  final String text;

  const DiffWidget({Key? key , required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if (text.length == 0) {
      return Container(
        margin: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(1.0),
            
          ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(
          'New Hunk',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Coluna',
            fontSize: 20.0,
          ),
        ),
      );
    }
    if (text[0] == '+') {
      return Container(
        margin: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(1.0),
            
          ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          // textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      );
    } else if (text[0] == '-') {
      return Container(
        margin: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(1.0),
            
          ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          // textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(1.0),
          ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          // textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      );
    }
  }
}
