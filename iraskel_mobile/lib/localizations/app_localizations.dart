import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../main.dart';

class LocalizationHelper {
  final Locale locale;

  LocalizationHelper(this.locale);

  static LocalizationHelper? of(BuildContext context) {
    return Localizations.of<LocalizationHelper>(context, LocalizationHelper);
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
     case 'tn':
        _temp = Locale(language.languageCode, 'TN');
        break;
      default:
        _temp = Locale(language.languageCode, 'FR');
    }
    MyApp.setLocale(context, _temp);
  }

  static const LocalizationsDelegate<LocalizationHelper> delegate =
      _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings = {};

  Future<bool> _load() async {
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
  // ignore: non_constant_identifier_names
  String? get t_languageTitle => _translate('languageTitle');
  // ignore: non_constant_identifier_names
  String? get t_buttonText => _translate('buttonText');
  // ignore: non_constant_identifier_names
  String? get t_skip => _translate("skip");
  // ignore: non_constant_identifier_names
  String? get t_continue => _translate("continue");

  //Carousel Textes
  // ignore: non_constant_identifier_names
  String? get t_start => _translate('start');
  // ignore: non_constant_identifier_names
  String? get t_participate => _translate('participate');
  // ignore: non_constant_identifier_names
  String? get t_communicate => _translate('communicate');
  // ignore: non_constant_identifier_names
  String? get t_win => _translate("win");
  // ignore: non_constant_identifier_names
  String? get t_join => _translate('join');
  // ignore: non_constant_identifier_names
  String? get t_startText => _translate('startText');
  // ignore: non_constant_identifier_names
  String? get t_participateText => _translate('participateText');
  // ignore: non_constant_identifier_names
  String? get t_communicateText => _translate('communicateText');
  // ignore: non_constant_identifier_names
  String? get t_winText => _translate("winText");
  // ignore: non_constant_identifier_names
  String? get t_joinText => _translate('joinText');

  //Sigup Form Labels
  // ignore: non_constant_identifier_names
  String? get t_firstname => _translate('firstname');
  // ignore: non_constant_identifier_names
  String? get t_lastname => _translate('lastname');
  // ignore: non_constant_identifier_names
  String? get t_country => _translate('country');
  // ignore: non_constant_identifier_names
  String? get t_state => _translate("state");
  // ignore: non_constant_identifier_names
  String? get t_municipality => _translate('municipality');
  // ignore: non_constant_identifier_names
  String? get t_rejoin => _translate("rejoin");
  // ignore: non_constant_identifier_names
  String? get t_code => _translate("code");
  // ignore: non_constant_identifier_names
  String? get t_confirmButton => _translate("confirmButton");
  // ignore: non_constant_identifier_names
  String? get t_confirmTitle => _translate("confirmTitle");
  // ignore: non_constant_identifier_names
  String? get t_home => _translate("home");
  // ignore: non_constant_identifier_names
  String? get t_notification => _translate("notification");
  // ignore: non_constant_identifier_names
  String? get t_calendar => _translate("calendar");
  // ignore: non_constant_identifier_names
  String? get t_menu => _translate("menu");
  // ignore: non_constant_identifier_names
  String? get t_connect => _translate("connectButton");

}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<LocalizationHelper> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['fr', 'ar', 'tn'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationHelper> load(Locale locale) async {
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
  final String languageName;

  Language(this.id, this.languageCode, this.languageName);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "FR", "Français"),
      Language(2, "AR", "عربي"),
      Language(3, "TN", "تونسي")
    ];
  }
}
