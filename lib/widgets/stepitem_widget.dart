import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  int stepno;
  String stepinfo;
  String stepdescription;

  StepItem(
      {Key? key,
      required this.stepno,
      required this.stepinfo,
      required this.stepdescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
        bottom: 4.0,
        top: 14.0,
        left: 8.0,
        right: 8.0,
      ),
      child: ListTile(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actions: [
                  TextButton(onPressed: () {
                      Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
                ],
                title: Text('Step Description'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('$stepdescription')],
                ),
              );
            },
          );
        },
        leading: Container(
            padding:
                EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 16.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: Colors.black38),
              ),
            ),
            child: Text(
              '$stepno',
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'Coluna',
              ),
            )),
        title: Text(stepinfo),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
}
