import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_dropdowninputdecorator.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

// ignore: constant_identifier_names
const TypeGraphql = """
""";
// ignore: constant_identifier_names
const Usage = """
""";

class BacForm extends StatefulWidget {
  const BacForm({Key? key}) : super(key: key);

  @override
  _BacFormState createState() => _BacFormState();
}

class _BacFormState extends State<BacForm> {
  setTypeId() {}
  setUsageId() {}
  setSize() {}

  // ignore: non_constant_identifier_names
  Object SizeItems = [
    {"id": "1", "name": "1L"},
    {"id": "2", "name": "2L"}
  ];

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
                      headerText: '${LocalizationHelper.of(context)!.t_bac}'),
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
                                    /*  Query(
                                        options: QueryOptions(
                                            document: gql(Usage),
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

                                          final listItems = result.data?[' '];

                                          return (DropdownInput(
                                              '${LocalizationHelper.of(context)!.t_usage}',
                                              listItems,
                                              ' ',
                                              'id',
                                              setUsageId));
                                        }),
                                    Query(
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
                                    DropdownInput(
                                        '${LocalizationHelper.of(context)!.t_size}',
                                        SizeItems,
                                        'name',
                                        'id',
                                        setSize),
                                        const Spacing(40),
                                      
                                        Image.asset('assets/images/bin.png',fit: BoxFit.contain,height: 150,)

                                        
                                    // StartImage('assets/images/bin.png', BoxFit.contain)
                                  ]))))
                ]))));
  }
}
