import 'package:flutter/material.dart';
import 'package:longy/widgets/name_widget.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LONGY',
            style: TextStyle(
              fontFamily: 'Coluna',
              color: Colors.pink,
            )
          ),
          SizedBox(height: 15.0),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'FontleroyBrown',
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                letterSpacing: 1.2,
              ),
              text: 'Made with ',
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                  text:' by F22'
                )
              ]
            ),
          ),
          SizedBox(height: 15.0),
          NameWidget(name:'Ayan Kumar'),
          NameWidget(name:'Pratham Powar'),
          NameWidget(name:'Shishir Sharma'),
          NameWidget(name:'Yashi Saxena'),
        ],
      ),
    );
  }
}
