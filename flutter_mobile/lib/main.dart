import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import './screen/Home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
       localizationsDelegates:const [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const[
         Locale('fr')
      ],
      debugShowCheckedModeBanner: false,
      title: 'Raskel Mobile Application',
      theme: ThemeData(
          textTheme: GoogleFonts.tajawalTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: const Color(0xFFDFF4EC)),
      //home: const Home(),
      //home: const GetStarted(),
      home: 
      OrientationBuilder(
        builder: (context, orientation) {
          return const GetStarted();
        },
        
      ),
      
      
      
    );
  }
}

