import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/stepbutton.dart';

class AppStepper extends StatefulWidget {
  final pagesLength;
  final controller;
  final int selectedIndex;
  final Function setter;
  const AppStepper(
      {Key? key,
      this.pagesLength,
      this.controller,
      required this.selectedIndex,
      required this.setter})
      : super(key: key);

  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<AppStepper> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...Iterable<int>.generate(widget.pagesLength).map(
          (int pageIndex) => Flexible(
              child: StepButton(
            pageIndex: pageIndex,
            controller: widget.controller,
            selectedIndex: widget.selectedIndex,
            setter: widget.setter,
          )),
        )
      ],
    );
  }
}
