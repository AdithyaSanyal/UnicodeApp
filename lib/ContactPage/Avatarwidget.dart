import 'package:flutter/material.dart';
import 'dart:math';

class Avatar_widget extends StatelessWidget {
  Avatar_widget({
    @required this.text,
  });
  final text;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
