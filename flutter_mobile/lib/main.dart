import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/screen/DrawerView.dart';
import './screen/SelectView.dart';
import './screen/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:Color(0xFF65C88D) ,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Color(0xFF65C88D),
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(color: Color(0xFF65C88D),fontSize: 30.0),
          bodyText2: TextStyle(color: Color(0xFF393E41),fontSize: 14.0),

        ),
        scaffoldBackgroundColor: Color(0xFFDFF4EC)
      ),
      home: Home(),
      
    );
  }
}

/*class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Builder(
            builder: (context) => Container(
                  child: Center(
                      child: FlatButton(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(50),
                    color: Colors.black38,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectView()));
                    },
                    child: Text('رسكل', style: (TextStyle(fontSize: 20))),
                  )),
                )),
      );
}*/
