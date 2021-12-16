import 'package:flutter/material.dart';
import 'package:longy/screens/diff_screen.dart';
import 'package:longy/screens/lcs_screen.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _screens = [
    LCSScreen(),
    DiffScreen(),
  ];
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontFamily: 'Coluna'),
        unselectedLabelStyle: TextStyle(fontFamily: 'Coluna'),
        selectedFontSize: 20,
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'LCS',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.functions),
            label: 'Diff',
          ),
        ],
      ),
    );
  }
}
