import 'package:flutter/material.dart';

class MultiLineInput extends StatefulWidget {
  final String hinttext;
  const MultiLineInput({Key? key, required this.hinttext}) : super(key: key);

  @override
  _MultiLineInputState createState() => _MultiLineInputState();
}

class _MultiLineInputState extends State<MultiLineInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 4,
      maxLines: 4,

      keyboardType: TextInputType
          .multiline, // user keyboard will have a button to move cursor to next line
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF65C88D)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDFF4EC)),
        ),
        hintText: widget.hinttext,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
