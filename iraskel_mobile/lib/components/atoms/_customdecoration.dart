import 'package:flutter/material.dart';

class CustomDecoration {
  late final String imageSrc;
// ignore: prefer_typing_uninitialized_variables
  late final fitType;

  CustomDecoration(this.imageSrc, this.fitType);
  BoxDecoration baseBackgroundDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imageSrc),
        fit: fitType,
      ),
    );
  }
}
