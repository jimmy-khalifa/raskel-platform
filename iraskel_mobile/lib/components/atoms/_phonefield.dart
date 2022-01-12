import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField extends StatelessWidget {
  final Function setter;
  // ignore: use_key_in_widget_constructors
  const PhoneField(this.setter);


  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      // controller:myController ,
      onChanged: (phone) {
        setter(phone.number);
        
      },
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
      /* onChanged: (phone) {
                                  print(phone.completeNumber);
                                },*/
    );
  }
}
