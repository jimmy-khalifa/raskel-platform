import 'package:flutter/material.dart';

class CustomInput extends  StatelessWidget {
 

  final String hinttext;
  final Function setter;
  // ignore: use_key_in_widget_constructors
  const CustomInput(this.hinttext, this.setter);

 
  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: myController,
      onChanged: (text) {
        setter(text);
      },
      cursorColor: const Color(0xFFDFF4EC),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF65C88D)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDFF4EC)),
        ),
        hintText: hinttext,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
