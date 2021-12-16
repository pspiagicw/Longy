import 'package:flutter/material.dart';
import 'package:longy/screens/history_screen.dart';
import 'package:longy/widgets/stepitem_widget.dart';
import 'package:longy/screens/about_screen.dart';
import 'package:longy/controller/lcscontroller.dart';

class LCSScreen extends StatefulWidget {
  const LCSScreen({Key? key}) : super(key: key);

  @override
  State<LCSScreen> createState() => _LCSScreenState();
}

class _LCSScreenState extends State<LCSScreen> {
  List<StepObject> steps = [];
  var string1Controller = TextEditingController();
  var string2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'calculate',
        onPressed: () {
          setState(() {
            steps = getSteps(string1Controller.text, string2Controller.text);
          });
        },
        icon: Icon(Icons.functions),
        label: Text(
          'CALCULATE',
          style: TextStyle(fontFamily: 'Coluna'),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AboutScreen()));
              }),
        ],
        title: Text(
          'Longy',
          style: TextStyle(
            fontFamily: 'Coluna',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: false,
                  controller: string1Controller,
                  decoration: InputDecoration(
                    hintText: 'String 1',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  autofocus: false,
                  controller: string2Controller,
                  decoration: InputDecoration(
                    hintText: 'String 2',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Theme.of(context).primaryColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: steps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StepItem(
                        stepno: index,
                        stepinfo: steps[index].header,
                        stepdescription: steps[index].description);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
