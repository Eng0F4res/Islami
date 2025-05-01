import 'package:flutter/material.dart';
import 'My_Theme_Data.dart';

class ThemeBSheet extends StatelessWidget {
  const ThemeBSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height*.3,
      child: Column(
        children: [
          Row(
            children: [
              Text('Light'),
              Spacer(),
              Icon(Icons.done)
            ],
          ),
          SizedBox(height: 5),
          Divider(color: MyThemeData.Cprime,indent: 80,endIndent: 80,),
          Row(
            children: [
              Text('Dark'),
              Spacer(),
              Icon(Icons.done)
            ],
          ),
        ],
      ),
    );
  }
}
