import 'dart:ui';

import 'package:flutter/material.dart';

class InformationItem extends StatelessWidget {
  final String text;
  final String itemText;

  InformationItem({@required this.text, @required this.itemText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text+'  ', style: TextStyle(color: Colors.green),),
              Expanded(child: Container(child: Text(itemText))),
            ],
          ),
        ),
      ),
    );
  }
}
