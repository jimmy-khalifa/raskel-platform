import 'package:flutter/material.dart';

import 'package:iraskel_mobile/localizations/app_localizations.dart';

import '../../main.dart';

class DropdownLanguageSelect extends StatefulWidget {
  const DropdownLanguageSelect({Key? key}) : super(key: key);

  @override
  State<DropdownLanguageSelect> createState() => _DropdownLanguageSelectState();
}

class _DropdownLanguageSelectState extends State<DropdownLanguageSelect> {
   Language? valueChoose ;

  /*setValueChoose(value) {
    setState(() {
      valueChoose = value;
    }); 
  }*/
  

  void _changeLanguage(Language language) {
    Locale _temp;
    //setValueChoose(language);
    switch (language.languageCode) {
      case 'FR':
        _temp = Locale(language.languageCode, 'FR');
        break;
      case 'AR':
        _temp = Locale(language.languageCode, 'AR');
        break;

      default:
        _temp = Locale(language.languageCode, 'FR');
    }
    
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
     
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10,
            vertical: MediaQuery.of(context).size.height / 10),
        child: InputDecorator(
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF65C88D)),
                    borderRadius: BorderRadius.circular(5.0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDFF4EC)),
                ),
                contentPadding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 100)),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Color(0xFF393E41),
              ),
               value: valueChoose,
               items: Language.languageList()
                  .map(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[Text(e.languageName)],
                      ),
                    ),
                  )
                  .toList(),
              // isExpanded: false,
             
              onChanged: (language) {
                _changeLanguage(language!);

               
                   

                //LocalizationHelper.ChangeLanguage(language!, context);
              },
             
            ))));
  }
}
