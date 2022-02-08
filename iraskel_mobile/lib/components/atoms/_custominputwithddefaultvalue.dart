import 'package:flutter/material.dart';

class CustomInputWithDefaultValue extends  StatelessWidget {
 
  final String? initialvalue;
  final String hinttext;
  final Function setter;
  // ignore: use_key_in_widget_constructors
  const CustomInputWithDefaultValue(this.hinttext, this.setter,this.initialvalue);

 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(initialvalue!),
      initialValue: initialvalue,
      //controller: TextEditingController(text: initialvalue),
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
