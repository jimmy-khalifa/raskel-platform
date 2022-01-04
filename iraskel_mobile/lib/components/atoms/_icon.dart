import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final  name;
  // ignore: prefer_typing_uninitialized_variables
  final color;
  // ignore: use_key_in_widget_constructors
  const CustomIcon(this.name,this.color);

  @override
  Widget build(BuildContext context) {
    return Icon(
      name, color: Color(color));
  }
}