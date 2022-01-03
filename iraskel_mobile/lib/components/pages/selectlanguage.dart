import 'package:flutter/material.dart';

import 'package:iraskel_mobile/components/templates/selectlanguagetemplate.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SelectLanguageTemplate(
              'assets/getstarted/back_login.png',
              orientation == Orientation.portrait
                  ? BoxFit.contain
                  : BoxFit.fitHeight,
              '${LocalizationHelper.of(context)!.t_languageTitle}',
              '${LocalizationHelper.of(context)!.t_continue}',
              orientation);
        },
      ),
    );
  }
}
