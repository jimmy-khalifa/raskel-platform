import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_custominput.dart';
import 'package:iraskel_mobile/components/atoms/_dropdowninputdecorator.dart';
import 'package:iraskel_mobile/components/atoms/_phonefield.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/atoms/datefield.dart';
import 'package:iraskel_mobile/components/atoms/h2.dart';
import 'package:iraskel_mobile/components/atoms/numinput.dart';
import 'package:iraskel_mobile/components/molecules/_profilewidget.dart';
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

class AccountForm extends StatefulWidget {
  const AccountForm({Key? key}) : super(key: key);

  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  late String stateId = "";
  late String municipalityId = "";
  late String lastName = "";
  late String firstName = "";
  late String phoneNumber = "";
  late String username = "";
  late String numCIN = "";
  late String age = "";
  TextEditingController cindateinput = TextEditingController();
  TextEditingController birthDate = TextEditingController();

  @override
  void initState() {
    cindateinput.text = ""; //set the initial value of text field
    birthDate.text = "";
    super.initState();
  }

  setStateId(value) {
    setState(() => {stateId = value});
  }

  setUserName(value) {
    setState(() => {username = value});
  }

  setMunicipalityId(value) {
    setState(() => {municipalityId = value});
  }

  setFirstName(value) {
    setState(() => {firstName = value});
  }

  setLastName(value) {
    setState(() => {lastName = value});
  }

  setPhoneNumber(value) {
    setState(() => {phoneNumber = value});
  }

  setNumCIN(value) {
    setState(() => {numCIN = value});
  }

  setAge(value) {
    setState(() => {age = value});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Card(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 20,
                  left: MediaQuery.of(context).size.width / 25,
                  right: MediaQuery.of(context).size.width / 25,
                  bottom: MediaQuery.of(context).size.height / 45),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                  margin: const EdgeInsets.only(
                      top: 25, left: 20, right: 20, bottom: 10),
                  child: Column(children: [
                    const FormHeader(headerText: 'Compte'),
                    Expanded(
                        child: SingleChildScrollView(
                            padding: EdgeInsets.zero,
                            reverse: true,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const ProfileWidget(),
                                  CustomInput('@ffoulen', setUserName),
                                  const Spacing(40),
                                  CustomInput('Fouleni', setFirstName),
                                  const Spacing(40),
                                  CustomInput('Foulen', setLastName),
                                  const Spacing(40),
                                  PhoneField(setPhoneNumber),
                                  const Spacing(40),

                                  /* QueryDropDownGraphQl(widget.grahqlCode1, widget.dropdowntextinput1,
                widget.listItems1, widget.text1),*/
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
                                  /*QueryDropDownGraphQl(widget.grahqlCode2,
                    widget.dropdowntextinput2, widget.listItems2, widget.text2),*/

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
                                  NumInput(
                                      hinttext: 'N° Carte identité',
                                      setter: setNumCIN),
                                  const Spacing(40),
                                  DateField(
                                    dateinput: cindateinput,
                                    hinttext: 'Date Délivré',
                                  ),
                                  const Spacing(40),
                                  DateField(
                                    dateinput: birthDate,
                                    hinttext: 'Date De Naissance',
                                  ),
                                  const Spacing(40),
                                  NumInput(hinttext: 'age', setter: setAge)
                                ],
                              ),
                            )))
                  ])));
        },
      ),
    );
  }
}
