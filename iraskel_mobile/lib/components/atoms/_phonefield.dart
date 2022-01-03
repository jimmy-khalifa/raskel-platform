import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField extends StatefulWidget {
  final Function setter;
  // ignore: use_key_in_widget_constructors
  const PhoneField(this.setter);

  @override
  _PhoneFieldState createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      // controller:myController ,
      onChanged: (phone) {
        widget.setter(phone);
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
