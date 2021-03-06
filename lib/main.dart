import 'package:flutter/material.dart';
import 'package:longy/screens/main_screen.dart';
import 'package:longy/screens/about_screen.dart';


void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Longy',
      home: MainScreen(),
    );
  }
  

}
