import 'package:flutter/material.dart';

class CustomInput extends  StatefulWidget {
 
 // final String? initialvalue;
  final String hinttext;
  final Function setter;
 
  // ignore: use_key_in_widget_constructors
  const CustomInput(this.hinttext, this.setter);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     
     // initialValue: initialvalue,
     /// controller: TextEditingController(text: initialvalue),
      onChanged: (text) {
        widget.setter(text);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
                return '* Required';
              }
               
              return null;
             
              
        
      },
      
      
      cursorColor: const Color(0xFFDFF4EC),
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
