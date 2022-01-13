import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iraskel_mobile/components/atoms/_custominput.dart';
import 'package:iraskel_mobile/components/atoms/_dropdowninputdecorator.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/atoms/multilineinput.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

const stateBYCountry = """
query(\$countryId: ID!){
  states_by_country(countryId: \$countryId){
    id
    code
    name
    name_ar
  }
}
""";

const municipalities = """
query(\$stateId: ID!){
  municipality_by_state(stateId: \$stateId){
    id
    code
    name
    name_ar
  }
}
""";

class AddressForm extends StatefulWidget {
  const AddressForm({Key? key}) : super(key: key);

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  late String pays = "";
  late String stateId = "";
  late String municipalityId = "";
  late String codePostal = "";
  bool isChecked = false;

  setPays(value) {
    setState(() => {pays = value});
  }

  setStateId(value) {
    setState(() => {stateId = value});
  }

  setMunicipalityId(value) {
    setState(() {
      municipalityId = value;
    });
  }

  setCodePostal(value) {
    setState(() {
      codePostal = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
                left: MediaQuery.of(context).size.width / 25,
                right: MediaQuery.of(context).size.width / 25,
                bottom: MediaQuery.of(context).size.height / 45),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
                margin: const EdgeInsets.only(
                    top: 25, left: 20, right: 20, bottom: 10),
                child: Column(children: [
                  const FormHeader(headerText: 'Adresse'),
                  Expanded(
                      child: SingleChildScrollView(
                          padding: EdgeInsets.zero,
                          child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomInput('Pays', setPays),
                                  const Spacing(40),
                                  Query(
                                      options: QueryOptions(
                                          document: gql(stateBYCountry),
                                          variables: {"countryId": "1"}),
                                      builder: (QueryResult result,
                                          {fetchMore, refetch}) {
                                        if (result.hasException) {
                                          return Text(
                                              result.exception.toString());
                                        }
                                        if (result.isLoading) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }

                                        final listItems1 =
                                            result.data?['states_by_country'];
                                        return (DropdownInput(
                                            '${LocalizationHelper.of(context)!.t_state}',
                                            listItems1,
                                            'name',
                                            'id',
                                            setStateId));
                                      }),
                                  const Spacing(40),
                                  Query(
                                      options: QueryOptions(
                                          document: gql(municipalities),
                                          variables: {"stateId": stateId}),
                                      builder: (QueryResult result,
                                          {fetchMore, refetch}) {
                                        if (result.hasException) {
                                          return Text(
                                              result.exception.toString());
                                        }
                                        if (result.isLoading) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }

                                        final listItems2 = result
                                            .data?['municipality_by_state'];
                                        return (DropdownInput(
                                            '${LocalizationHelper.of(context)!.t_municipality}',
                                            listItems2,
                                            'name',
                                            'id',
                                            setMunicipalityId));
                                      }),
                                  const Spacing(40),
                                  const MultiLineInput(
                                      hinttext: 'Complément d\'adresse'),
                                  const Spacing(40),
                                  CustomInput('Code Postale', setCodePostal),
                                  CheckboxListTile(
                                      activeColor: const Color(0xFF65C88D),
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                      title: Text(" Rester connecter",
                                          style: GoogleFonts.tajawal(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xFF393E41)))),
                                      controlAffinity:
                                          ListTileControlAffinity.leading),
                                ],
                              )))),
                ]))));
  }
}