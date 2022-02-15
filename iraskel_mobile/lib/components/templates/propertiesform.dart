import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/atoms/numinput.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

// ignore: constant_identifier_names
const TypeGraphql = """

""";

class PropertiesForm extends StatefulWidget {
  const PropertiesForm({Key? key}) : super(key: key);

  @override
  _PropertiesState createState() => _PropertiesState();
}

class _PropertiesState extends State<PropertiesForm> {
  late String nbPerson = "";
  late String surface = "";

  setTypeId() {}

  setNbPerson(value) {
    setState(() => {nbPerson = value});
  }

  setSurface(value) {
    setState(() {
      surface = value;
    });
  }

  // ignore: non_constant_identifier_names
  Map<String, bool?> HouseElements = {
    'Jardin': false,
    'Garage': false,
    'Bergerie': false,
    'Résidence principale': false,
    'Adresse Principale': false,
  };
  var holderList = [];
  getChecked() {
    HouseElements.forEach((key, value) {
      if (value == true) {
        holderList.add(key);
      }
    });
    //printing all checked items
    

    // remove the array after use
    holderList.clear();
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
                  FormHeader(
                      headerText:
                          '${LocalizationHelper.of(context)!.t_property}'),
                  Expanded(
                      child: SingleChildScrollView(
                          primary: false,
                          padding: EdgeInsets.zero,
                          child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                /*    Query(
                                        options: QueryOptions(
                                            document: gql(TypeGraphql),
                                            variables: {}),
                                        builder: (QueryResult result,
                                            {fetchMore, refetch}) {
                                          if (result.hasException) {
                                            return Text(
                                                result.exception.toString());
                                          }
                                          if (result.isLoading) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          final listItems3 = result.data?[' '];

                                          return (DropdownInput(
                                              '${LocalizationHelper.of(context)!.t_type}',
                                              listItems3,
                                              ' ',
                                              'id',
                                              setTypeId));
                                        }),*/
                                    const Spacing(40),
                                    NumInput(
                                        hinttext:
                                            '${LocalizationHelper.of(context)!.t_personNumber}',
                                        setter: setNbPerson),
                                    const Spacing(40),
                                    NumInput(
                                        hinttext:
                                            '${LocalizationHelper.of(context)!.t_area}',
                                        setter: setSurface),
                                    const Spacing(40),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: HouseElements.keys
                                              .map((String key) {
                                            return CheckboxListTile(
                                                activeColor:
                                                    const Color(0xFF65C88D),
                                                checkColor:
                                                    const Color(0xFF65C88D),
                                                title: Text(key),
                                                value: HouseElements[key],
                                                onChanged: (value) {
                                                  setState(() {
                                                    HouseElements[key] = value;
                                                  });
                                                });
                                          }).toList(),
                                        ))
                                  ]))))
                ]))));
  }
}
