import 'package:flutter/material.dart';
import 'package:longy/controller/diffcontroller.dart';

class DiffScreen extends StatefulWidget {
  DiffScreen({Key? key}) : super(key: key);

  @override
  State<DiffScreen> createState() => _DiffScreenState();
}

class _DiffScreenState extends State<DiffScreen> {
  var firstStringController = TextEditingController();
  var secondStringController = TextEditingController();
  var diffStringController = TextEditingController();

  @override
  void dispose() {
    firstStringController.dispose();
    secondStringController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DIFF',
          style: TextStyle(
            fontFamily : 'Coluna',
          )
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'DIFF IT',
          style: TextStyle(
            fontFamily: 'Coluna'
          ),
        ),
        onPressed: () {
          diffStringController.text = calculateDiff(
              firstStringController.text, secondStringController.text);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Source A',
                  border: OutlineInputBorder(),
                ),
                controller: firstStringController,
                maxLines: 3,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Source B',
                  border: OutlineInputBorder(),
                ),
                controller: secondStringController,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              TextField(
                controller: diffStringController,
                maxLines: 10,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Diff',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Under Contstruction for Group Project 3!',
                style: TextStyle(
                  fontFamily: 'Coluna',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
