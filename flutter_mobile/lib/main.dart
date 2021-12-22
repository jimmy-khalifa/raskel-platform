import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import './screen/Home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './screen/_getstarted.dart';
import 'app_localizations.dart';

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
    state!.setLocale(newLocale);
  }
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale = const Locale('fr', 'FR') ;

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
