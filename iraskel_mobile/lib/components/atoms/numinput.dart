import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumInput extends StatefulWidget {
  final String hinttext;
  final Function setter;
  final String? initialvalue;
  // ignore: use_key_in_widget_constructors
  const NumInput(  this.hinttext, this.initialvalue, this.setter);
     

  @override
  _NumInputState createState() => _NumInputState();
}

class _NumInputState extends State<NumInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: myController,
      key: Key(widget.initialvalue!),
      initialValue: widget.initialvalue,
      

      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (text) {
        widget.setter(text);
      },
      cursorColor: const Color(0xFFDFF4EC),
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
