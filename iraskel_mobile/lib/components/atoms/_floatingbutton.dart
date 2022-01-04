import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final color;
  // ignore: prefer_typing_uninitialized_variables
  final nameIcon;
  final Function onpressed;
  // ignore: use_key_in_widget_constructors
  const CustomFloatingButton(this.color,this.nameIcon,this.onpressed);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
              backgroundColor:  Color(color),
              child:  Icon(nameIcon),
              onPressed: () {
               onpressed();
              }
      
    );
  }
}