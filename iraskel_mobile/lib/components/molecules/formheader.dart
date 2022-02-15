import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';

class FormHeader extends StatelessWidget {
  final String headerText;
  const FormHeader({Key? key, required this.headerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BigTitle(headerText,36.0),
        Divider(
          color: const Color(0xFF65C88D),
          endIndent: 5,
          indent: MediaQuery.of(context).size.width / 25,
          height: MediaQuery.of(context).size.width / 25,
        ),
      ],
    );
  }
}
