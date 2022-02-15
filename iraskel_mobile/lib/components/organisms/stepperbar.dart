import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/molecules/stepper.dart';
import 'package:iraskel_mobile/components/pages/signup.dart';

class StepperBar extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final pagesLength;
  final String buttonText;
  // ignore: prefer_typing_uninitialized_variables
  final horizPadding;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final int selectedIndex;
  final Function setter;

  const StepperBar(
      {Key? key,
      this.pagesLength,
      required this.buttonText,
      this.horizPadding,
      this.controller,
      required this.selectedIndex,
      required this.setter})
      : super(key: key);

  @override
  _StepperBarState createState() => _StepperBarState();
}

class _StepperBarState extends State<StepperBar> {
  onpressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        height: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppStepper(
              pagesLength: widget.pagesLength,
              controller: widget.controller,
              selectedIndex: widget.selectedIndex,
              setter: widget.setter,
            ),
            Button(widget.buttonText, onpressed,MediaQuery.of(context).size.width /10,MediaQuery.of(context).size.height / 80),
          ],
        ),
      ),
    );
  }
}
