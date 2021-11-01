import 'package:flutter/material.dart';
import 'package:flutter_mobile/components/_collects.dart';
import 'package:flutter_mobile/components/_notifications.dart';
import 'package:flutter_mobile/components/_social.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ListView(
             children: const [
                Collects(), 
                Notifications(), 
                Social()],
    ));
  }
}