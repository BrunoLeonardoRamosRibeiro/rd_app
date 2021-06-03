import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String title;

  HeaderTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
