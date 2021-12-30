import 'package:flutter/material.dart';

class StepButton extends StatefulWidget {
  final pageIndex;
  final controller;
  final int selectedIndex;
  final Function setter;

  const StepButton(
      {Key? key,
      this.pageIndex,
      this.controller,
      required this.selectedIndex,
      required this.setter})
      : super(key: key);

  @override
  _StepButtonState createState() => _StepButtonState();
}

class _StepButtonState extends State<StepButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {
              widget.controller.animateToPage(widget.pageIndex),
              setState(() {
                widget.setter(widget.pageIndex);
              }),
            },
        child: const Text(""),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          fixedSize: const Size(10, 10),
          maximumSize: const Size(12, 12),
          minimumSize: const Size(8, 8),
          shadowColor: const Color(0X00FFFFFF),
          primary: widget.selectedIndex == widget.pageIndex
              ? const Color(0xFF65C88D)
              : const Color(0x5565C88D),
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
        ));
  }
}
