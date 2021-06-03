import 'package:flutter/material.dart';
import 'package:rd_app/core/framework/constants.dart';

class LogoRaiaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Image.asset(logoRaia),
      ),
    );
  }
}
