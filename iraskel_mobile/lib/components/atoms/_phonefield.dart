import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField extends StatelessWidget {
  final Function setter;
  //final String? initialvalue;
  // ignore: use_key_in_widget_constructors
  const PhoneField(
    this.setter,
  );

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      //  controller: TextEditingController(text: initialvalue) ,
      keyboardType: TextInputType.phone,
      // initialValue: initialvalue,
      onChanged: (phone) {
        setter(phone.number);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '* Required';
        } else if (value.length < 8) {
          return "Mot de passe doit contenir 8 nombres";
        }
        return null;
      },
      //keyboardType: ,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF65C88D)),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFDFF4EC))),
        filled: true,
        fillColor: Colors.white,
        hintText: "XXXXXXXX",
      ),
      initialCountryCode: 'TN',
     
    );
  }
}
