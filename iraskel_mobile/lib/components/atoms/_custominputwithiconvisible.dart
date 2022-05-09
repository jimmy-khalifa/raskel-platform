import 'package:flutter/material.dart';

class CustomInputWithEye extends  StatefulWidget {
 
 // final String? initialvalue;
  final String hinttext;
  final Function setter;
 
  // ignore: use_key_in_widget_constructors
  const CustomInputWithEye(this.hinttext, this.setter);

  @override
  State<CustomInputWithEye> createState() => _CustomInputWithEyeState();
}

class _CustomInputWithEyeState extends State<CustomInputWithEye> {
  late bool _codevisible;
  @override
  void initState() {
    _codevisible = false;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:_codevisible ,
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
        suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               _codevisible
               ? Icons.visibility_off
               : Icons.visibility,
      ), onPressed: () { 
         setState(() {
                   _codevisible = !_codevisible;
               });
       })),
    );
  }
}
