import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool valueElement;
  final String title;
  final Function setter;
  // ignore: use_key_in_widget_constructors
  const CustomCheckbox(this.title, this.valueElement, this.setter);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        activeColor: const Color(0xFF65C88D),
        checkColor: const Color(0xFF65C88D),
        title: Text(widget.title),
        value: widget.valueElement,
        onChanged: (value){
           widget.setter(value);

        }
    );
       
  }
}
