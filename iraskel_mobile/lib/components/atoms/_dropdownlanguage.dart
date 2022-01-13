import 'package:flutter/material.dart';

import 'package:iraskel_mobile/localizations/app_localizations.dart';

import '../../main.dart';

class DropdownLanguageSelect extends StatefulWidget {
  const DropdownLanguageSelect({Key? key}) : super(key: key);

  @override
  State<DropdownLanguageSelect> createState() => _DropdownLanguageSelectState();
}

class _DropdownLanguageSelectState extends State<DropdownLanguageSelect> {
   void _changeLanguage(Language language) {
    Locale _temp;
    switch (language.languageCode) {
      case 'FR':
        _temp = Locale(language.languageCode, 'FR');
        break;
      case 'AR':
        _temp = Locale(language.languageCode, 'AR');
        break;
      case 'TN':
        _temp = Locale(language.languageCode, 'TN');
        break;
      default:
        _temp = Locale(language.languageCode, 'FR');
    }
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
     
        child: DropdownButton<Language>(
      underline: const SizedBox(),
      icon: const Icon(
        Icons.language,
        color: Color(0xFF393E41),
      ),
      onChanged: ( language) {
       //LocalizationHelper.ChangeLanguage(language!, context);
       _changeLanguage(language!);
      },
      items: Language.languageList()
          .map<DropdownMenuItem<Language>>(
            (e) => DropdownMenuItem<Language>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[Text(e.languageName)],
              ),
            ),
          )
          .toList(),
    ));
  }
}
