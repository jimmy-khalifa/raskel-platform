import 'package:flutter/material.dart';

class StartImage extends StatelessWidget {
  final String imageSrc;
  // ignore: prefer_typing_uninitialized_variables
  final  fitType;

  // ignore: use_key_in_widget_constructors
  const StartImage(this.imageSrc, this.fitType);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageSrc,
      fit: fitType,
    );
  }
}
