import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import './screen/Home.dart';
import './screen/_getstarted.dart';

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
      title: 'Raskel Mobile Application',
      theme: ThemeData(
          textTheme: GoogleFonts.tajawalTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: const Color(0xFFDFF4EC)),
      //home: const Home(),
      //home: const GetStarted(),
      home: OrientationBuilder(
        builder: (context, orientation) {
          return const GetStarted();
        },
      ),
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
