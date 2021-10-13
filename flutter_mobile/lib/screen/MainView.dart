import 'package:flutter/material.dart';
import 'SelectView.dart';
class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: FlatButton(
        shape: CircleBorder(),
        padding: EdgeInsets.all(50),
        color: Colors.black38,
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> SelectView())
          
          );
        },
        child: Text('رسكل'),
      )),
    );
  }
}
