import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class  DropdownInputWithoutvalue extends StatefulWidget {
  final String dropdowntextinput;
  final String text;
  final String id;
  // ignore: prefer_typing_uninitialized_variables
  final listItems;
  //final String stateId;
  final Function setter;
  
  // ignore: use_key_in_widget_constructors
  const DropdownInputWithoutvalue(
      this.dropdowntextinput, this.listItems, this.text, this.id, this.setter);

  @override
  _DropdownInputWithoutvalueState createState() => _DropdownInputWithoutvalueState();
}

class _DropdownInputWithoutvalueState extends State<DropdownInputWithoutvalue> {
  String? _valueChoose;
 
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFFFFFF),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF65C88D)),
                borderRadius: BorderRadius.circular(5.0)),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDFF4EC)),
            ),
            contentPadding:
                EdgeInsets.all(MediaQuery.of(context).size.height / 100)),
        child: 
         DropdownButtonHideUnderline(
           
            child: DropdownButton<String>(
              
          hint: Text(widget.dropdowntextinput),
          icon: const Icon(
            FeatherIcons.chevronDown,
            color: Color(0xFFDFF4EC),
          ),
          iconSize: 36,
          isExpanded: true,
          
          value: _valueChoose,
          onChanged: (newvalue) => setState(() {
            _valueChoose = newvalue;
            widget.setter(newvalue);
          }),
          items: widget.listItems.map<DropdownMenuItem<String>>((valueItem) {
         
         
            return DropdownMenuItem<String>(
              value: valueItem[widget.id],
              //  key: valueItem[widget.id],
              child: Text(valueItem[widget.text]),
            );
          }).toList(),
        )));
  }
}
