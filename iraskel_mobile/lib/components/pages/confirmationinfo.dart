import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

class ConfirmationInfo extends StatefulWidget {
  const ConfirmationInfo({Key? key}) : super(key: key);

  @override
  _ConfirmationInfoState createState() => _ConfirmationInfoState();
}

class _ConfirmationInfoState extends State<ConfirmationInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
      return Card(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 20,
              left: MediaQuery.of(context).size.width / 25,
              right: MediaQuery.of(context).size.width / 25,
              bottom: MediaQuery.of(context).size.height / 45),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(children: [
            FormHeader(
                headerText:
                    '${LocalizationHelper.of(context)!.t_confirmation}'),
            Expanded(
                child: SingleChildScrollView(
              primary: false,
              child: Column(
                children: [
                  BigTitle( '${LocalizationHelper.of(context)!.t_personal_information}', 20),
               /*   RowInsideRow("Username:", "response1", "Phone:", "response2"),
                  RowInsideRow("Prénom:", "response1", "Nom:", "response2"),
                  RowInsideRow(
                      "Date Naissance:", "response1", "Age", "response2"),
                  RowInsideRow("CIN:", "response1", "Délivré Le:", "response2"),*/
                  const Spacing(20),
                  BigTitle( '${LocalizationHelper.of(context)!.t_address}', 20),
               /*   RowInsideRow(
                      "Pays:", "response1", "Gouvernorat:", "response2"),
                  RowInsideRow(
                      "Municipalité:", "response1", " Quartier:", "response2"),
                  CustomRow("Compléments:", "response",),
                  RowInsideRow(
                      "Code postale:", "response1", " Principale:", "Oui"),*/
                      const Spacing(20),
                  BigTitle( '${LocalizationHelper.of(context)!.t_property}', 20),
                 /* RowInsideRow("Type:", "response1", "Nbre Personne:", "5"),
                  RowInsideRow("Surface:", "response1", " Jardin:", "Non"),
                  RowInsideRow(
                      "Garage:", "oui", " Bergerie:", "Oui"),
                  RowInsideRow(
                      "Principale:", "oui", " Adresse Principale:", "Oui"),*/
                      const Spacing(20),
                      BigTitle( '${LocalizationHelper.of(context)!.t_bac}', 20),
               /*   RowInsideRow("Usage:", "response1", "Type:", "5"),
                  CustomRow("Taille:", "response",),*/
                 
                ],
              ),
            ))
          ]));
    }));
  }
}
