import 'package:flutter/material.dart';

class StartImage extends StatelessWidget {
  final imageSrc;

  const StartImage({Key? key, this.imageSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      imageSrc,
      fit: BoxFit.scaleDown,
    ));
  }
}
