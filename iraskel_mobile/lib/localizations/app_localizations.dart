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
  // ignore: non_constant_identifier_names
  String? get t_company=>_translate("company");
  // ignore: non_constant_identifier_names
  String? get t_garden=> _translate("garden");
  // ignore: non_constant_identifier_names
  String? get t_garage=>_translate("garage");
  // ignore: non_constant_identifier_names
  String? get t_address=> _translate("address");
  // ignore: non_constant_identifier_names
  String? get t_residence => _translate("residence");
  // ignore: non_constant_identifier_names
  String? get t_sheepfold => _translate("sheepfold");
  // ignore: non_constant_identifier_names
  String? get t_type => _translate("type");
  // ignore: non_constant_identifier_names
  String? get t_personNumber => _translate('personNumber');
  // ignore: non_constant_identifier_names
  String? get t_area => _translate("area");
  // ignore: non_constant_identifier_names
  String? get t_property => _translate("property");
  // ignore: non_constant_identifier_names
  String? get t_bac => _translate("bac");
  // ignore: non_constant_identifier_names
  String? get t_usage => _translate("usage");
  // ignore: non_constant_identifier_names
  String? get t_size => _translate("size");
  // ignore: non_constant_identifier_names
  String? get t_confirmation => _translate("confirmation");
  // ignore: non_constant_identifier_names
  String? get t_account => _translate("account");
  // ignore: non_constant_identifier_names
  String? get t_update => _translate("update");
  // ignore: non_constant_identifier_names
  String? get t_upload => _translate("upload");
  // ignore: non_constant_identifier_names
  String? get t_identity_card => _translate("identityCard");
  // ignore: non_constant_identifier_names
  String? get t_delivery_date => _translate("deliveryDate");
  // ignore: non_constant_identifier_names
  String? get t_birth => _translate("birth");
  // ignore: non_constant_identifier_names
  String? get t_age => _translate("age");
  // ignore: non_constant_identifier_names
  String? get t_registration => _translate("registration");
  // ignore: non_constant_identifier_names
  String? get t_cancel => _translate("cancel");
  // ignore: non_constant_identifier_names
  String? get t_ok => _translate("ok");
  // ignore: non_constant_identifier_names
  String? get t_congrats => _translate("congrats");
  // ignore: non_constant_identifier_names
  String? get t_complementeryadrress => _translate("complementeryadrress");
  // ignore: non_constant_identifier_names
  String? get t_postal_code => _translate("postalCode");
  // ignore: non_constant_identifier_names
  String? get t_restconnected => _translate("restConnected");
  // ignore: non_constant_identifier_names
  String? get t_personal_information => _translate("personalInformation");
  // ignore: non_constant_identifier_names
  String? get t_invoice => _translate("invoice");
  // ignore: non_constant_identifier_names
  String? get t_settings => _translate("settings");
  // ignore: non_constant_identifier_names
  String? get t_logout => _translate("logout");
  // ignore: non_constant_identifier_names
  String? get t_principaladress => _translate("principaladress");
  // ignore: non_constant_identifier_names
  String? get t_district => _translate("district");
  // ignore: non_constant_identifier_names
  String? get t_yes => _translate("yes");
  // ignore: non_constant_identifier_names
  String? get t_no => _translate("no");
  // ignore: non_constant_identifier_names
  String? get t_Tunis => _translate('tunisie');
  // ignore: non_constant_identifier_names
  String? get t_username => _translate('username');
  // ignore: non_constant_identifier_names
  String? get t_phone => _translate('phone');
  // ignore: non_constant_identifier_names
  String? get t_brand => _translate('brand');
  // ignore: non_constant_identifier_names
  String? get t_volume => _translate('volume');
  // ignore: non_constant_identifier_names
  String? get t_color => _translate('color');
  // ignore: non_constant_identifier_names
  String? get t_no_image_selected => _translate('noimage');
  // ignore: non_constant_identifier_names
  String? get t_success => _translate('success');
  // ignore: non_constant_identifier_names
  String? get t_cin_front => _translate('cinfront');
    // ignore: non_constant_identifier_names
    String? get t_cin_back => _translate('cinback');
  // ignore: non_constant_identifier_names
  String? get t_cin => _translate('cin');



  





}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<LocalizationHelper> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['fr', 'ar'].contains(locale.languageCode);
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
     // Language(3, "TN", "تونسي")
    ];
  }
}
