import 'package:flutter/material.dart';

class MultiLineInput extends StatefulWidget {
  final String hinttext;
  final String initialvalue;
  final Function setter;

  const MultiLineInput({Key? key, required this.hinttext,required this.initialvalue,required this.setter}) : super(key: key);

  @override
  State<MultiLineInput> createState() => _MultiLineInputState();
}

class _MultiLineInputState extends State<MultiLineInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 4,
      maxLines: 4,
       key: Key(widget.initialvalue),
      initialValue: widget.initialvalue,
      onChanged: (text) {
        widget.setter(text);
      },

      keyboardType: TextInputType
          .multiline, // user keyboard will have a button to move cursor to next line
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF65C88D)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDFF4EC)),
        ),
        labelText: widget.hinttext,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
