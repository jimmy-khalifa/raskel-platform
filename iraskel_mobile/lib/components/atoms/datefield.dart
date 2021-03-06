import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  final TextEditingController dateinput;
 
  final String hinttext;
  final String initialvalue;
  final String valueName;
  
  const DateField({Key? key, required this.dateinput, required this.hinttext,required this.valueName, required this.initialvalue})
      : super(key: key);

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  late String birthDateInString;
late DateTime birthDate;
 late final Box box = Hive.box('auth');
  //text editing controller for text field
  @override
  Widget build(BuildContext context) {
    return TextFormField(
    //  key: Key(widget.initialvalue),
      
     // initialValue: widget.initialvalue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '* Required';
        }
        return null;
      },
     
      
      controller: widget.dateinput, //editing controller of this TextField
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.calendar_today), //icon of text field
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF65C88D)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDFF4EC)),
        ),
        labelText: widget.hinttext,
        filled: true,
        fillColor: Colors.white,
        //label text of field
      ),
      readOnly: true, //set it true, so that user will not able to edit text
      onTap: () async {
        final pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                1900), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
         // String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          setState(() {
            //widget.dateinput.text =
               // formattedDate; //set output date to TextField value.
               birthDate = pickedDate;
               widget.dateinput.text = DateFormat('yyyy-MM-dd').format(pickedDate);
               //"${birthDate.year}-${birthDate.month}-${birthDate.day}";
                box.put(widget.valueName,  widget.dateinput.text );
          });
        }
      },
    );
  }
}
