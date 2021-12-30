import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final  int;
  // ignore: use_key_in_widget_constructors
  const Spacing(this.int);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: MediaQuery.of(context).size.height /  int,
      
    );
  }
}