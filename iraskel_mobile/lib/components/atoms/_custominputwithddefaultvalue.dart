import 'package:flutter/material.dart';

class CustomInputWithDefaultValue extends  StatefulWidget {
 
  final String? initialvalue;
  final String hinttext;
  final Function setter;
  final bool enabled;
  final bool read;
  final bool enable;
  // ignore: use_key_in_widget_constructors
  const CustomInputWithDefaultValue(this.hinttext, this.setter,this.initialvalue, this.enabled, this.read, this.enable);

  @override
  State<CustomInputWithDefaultValue> createState() => _CustomInputWithDefaultValueState();
}

class _CustomInputWithDefaultValueState extends State<CustomInputWithDefaultValue> {
   

  @override
  
  Widget build(BuildContext context) {
    
    return  
    TextFormField(


      validator: (value) {
        if (value == null || value.isEmpty) {
                return '* Required';
              }
               
              return null;
             
              
        
      },
      readOnly: widget.read,
      enabled: widget.enable,
    
     // key: Key(widget.initialvalue!),
      initialValue: widget.initialvalue,
      //controller: TextEditingController(text: initialvalue),
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
        labelText: widget.hinttext,
        filled: true,
       fillColor: widget.enabled ? Colors.white : Colors.grey.shade200,
      ),
    );
  }
}
