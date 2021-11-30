import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.history),
              title: Text('History $index'),
              subtitle: Column(
                children: [
                  Text('History Description $index'),
                  Text('History Description $index')
                ],
              ),
            );
          }),
    );
  }
}
