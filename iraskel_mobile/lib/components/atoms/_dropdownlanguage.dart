import 'package:flutter/material.dart';

import 'package:iraskel_mobile/localizations/app_localizations.dart';

class DropdownLanguageSelect extends StatelessWidget {
  const DropdownLanguageSelect({Key? key}) : super(key: key);

  // final String titleradio;
  // ignore: use_key_in_widget_constructors
  //const DropdownLanguageSelect( this.titleradio);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownButton<Language>(
      underline: const SizedBox(),
      icon: const Icon(
        Icons.language,
        color: Color(0xFF393E41),
      ),
      onChanged: (language) {
        LocalizationHelper.ChangeLanguage(language!, context);
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
