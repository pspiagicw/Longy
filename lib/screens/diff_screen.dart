import 'package:flutter/material.dart';
import 'package:longy/controller/diffcontroller.dart';
import 'package:longy/widgets/diff_widget.dart';

class DiffScreen extends StatefulWidget {
  DiffScreen({Key? key}) : super(key: key);

  @override
  State<DiffScreen> createState() => _DiffScreenState();
}

class _DiffScreenState extends State<DiffScreen> {
  var firstStringController = TextEditingController();
  var secondStringController = TextEditingController();
  var diffStringController = TextEditingController();
  List<String> diff = <String>[];

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
        title: Text('DIFF',
            style: TextStyle(
              fontFamily: 'Coluna',
            )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'DIFF IT',
          style: TextStyle(fontFamily: 'Coluna'),
        ),
        onPressed: () {
          setState(() {
            diff = calculateDiff(
                firstStringController.text, secondStringController.text);
          });
        },
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Source A',
                border: OutlineInputBorder(),
              ),
              controller: firstStringController,
              maxLines: 2,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Source B',
                border: OutlineInputBorder(),
              ),
              controller: secondStringController,
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: diff.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DiffWidget(text: diff[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
