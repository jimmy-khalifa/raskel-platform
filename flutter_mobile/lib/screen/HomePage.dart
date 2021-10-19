import 'package:flutter/material.dart';
import 'package:flutter_mobile/components/collects.dart';
import 'package:flutter_mobile/components/notifications.dart';
import 'package:flutter_mobile/components/social.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        child: Container(
            child: ListView(
             children: [
               Collects(), 
               Notifications(), 
               Social()],
    ))));
  }
}
