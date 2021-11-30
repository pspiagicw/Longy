import 'package:flutter/material.dart';
import 'package:longy/screens/history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Longy')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryScreen(),
                  ));
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
              bottom: 10.0,
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'String 1'),
                ),
                TextField(decoration: InputDecoration(hintText: 'String 2')),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Calculate')),
              ],
            ),
          ),
          Text(
            'Steps for caculation',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.done),
                    title: Text('Step $index'),
                    subtitle: Text(
                      'Description $index',
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
