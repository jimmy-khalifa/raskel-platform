import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iraskel_mobile/components/pages/selectlanguage.dart';

import 'localizations/app_localizations.dart';

void main() {
  final HttpLink httpLink = HttpLink("http://172.17.32.3:8000/graphql/");
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );
  var app = GraphQLProvider(client: client, child: const MyApp());
  runApp(app);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale){

   _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late Locale _locale =  const Locale('fr', 'FR') ;

  void setLocale( Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      supportedLocales: const [
        Locale('ar', 'AR'),
        Locale('fr', 'FR'),
        Locale('tn', 'TN'),
      ],
      localizationsDelegates: const [
        // built in localizations of basic text for material widgets
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // a class which load the transformations from JSON files
        //AppLocalizations.delegate,
        // for text directions LTR-RTL
        GlobalWidgetsLocalizations.delegate,
        LocalizationHelper.delegate
      ],
      //returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        //check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },

      debugShowCheckedModeBanner: false,
      title: 'Raskel Mobile Application',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
         textTheme: GoogleFonts.tajawalTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: const Color(0xFFDFF4EC)
      ),
      home:  OrientationBuilder(
        builder: (context, orientation) {
          return const SelectLanguage();
        },
      ),
    );
  }
}
  

