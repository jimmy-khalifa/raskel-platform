import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../main.dart';

class LocalizationHelper {

  final Locale locale; 

  LocalizationHelper(this.locale);

  static LocalizationHelper? of (BuildContext context) {
    return Localizations.of < LocalizationHelper > (context, LocalizationHelper);
  }
  // ignore: non_constant_identifier_names
  static void ChangeLanguage(Language language, BuildContext context) {
    Locale _temp;
    switch (language.languageCode) {
      case 'fr':
        _temp = Locale(language.languageCode, 'FR');
        break;
      case 'ar':
        _temp = Locale(language.languageCode, 'AR');
        break;
      default:
        _temp = Locale(language.languageCode, 'FR');
    }
     MyApp.setLocale(context, _temp);  }

  static const LocalizationsDelegate<LocalizationHelper > delegate =
    _AppLocalizationsDelegate();

   Map< String, String> _localizedStrings = {};

  Future < bool > _load() async {
    String jsonString =
      await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);


    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }
  //to translate directly what we want described in the lang files
  String? _translate(String key) {
    return _localizedStrings[key];
  }

  // ignore: non_constant_identifier_names
  String? get t_description => _translate('description');

}


class _AppLocalizationsDelegate
extends LocalizationsDelegate < LocalizationHelper > {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [ 'fr', 'ar', 'tn' ].contains(locale.languageCode);
  }

  @override
  Future < LocalizationHelper > load(Locale locale) async {
    LocalizationHelper localizations = LocalizationHelper(locale);
    await localizations._load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

class Language {
  final int id;
  final String languageCode;

  Language(this.id,   this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "fr"),
      Language(2, "ar"),
      Language(3, "tn")
     
    ];
  }
}