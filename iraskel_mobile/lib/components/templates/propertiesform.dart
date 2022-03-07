import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:iraskel_mobile/components/atoms/_customcheckbox.dart';
import 'package:iraskel_mobile/components/atoms/_dropdowninputdecorator.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/atoms/numinput.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

// ignore: constant_identifier_names
const TypeGraphql = """
query {
  all_property_types{
    id
    code
    name
  }
}


""";

class PropertiesForm extends StatefulWidget {
  const PropertiesForm({Key? key}) : super(key: key);

  @override
  _PropertiesState createState() => _PropertiesState();
}

class _PropertiesState extends State<PropertiesForm> {
  late String? nbPerson ="";
  late String? surface = "";
  late String typeId = "";
  late final Box box = Hive.box('auth');



  setTypeId(value) {
    setState(() {
      typeId = value;
    });
      box.put('typeId', value);

  }

  setNbPerson(value) {
    setState(() => {nbPerson = value});
    box.put('individuals', value);

  }

  setSurface(value) {
    setState(() {
      surface = value;
    });
    box.put('area', value);
  }
  // ignore: non_constant_identifier_names
  late bool has_garden = false;
  // ignore: non_constant_identifier_names
  late bool has_garage = false;
  // ignore: non_constant_identifier_names
  late bool has_sheepfold = false;
  // ignore: non_constant_identifier_names
  late bool has_residence = false;
  // ignore: non_constant_identifier_names
  late bool has_adress_principal = false;

  setHasGarden(value){
    setState(() {
      has_garden= value;
    });
    box.put('has_garden', value);
  }
  setHasGarage (value){
    setState(() {
      has_garage = value;
    });
    box.put('has_garage', value);
  }
  setHasSheepfold(value){
    setState(() {
      has_sheepfold = value;
    });
    box.put('has_sheepfold', value);
  }
  setHasResidence(value){
    setState(() {
      has_residence = value;
    });
    box.put('has_residence', value);
  }
  setHasAdress(value){
    setState(() {
      has_adress_principal= value;
    });
    box.put('has_adress', value);
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
                                   Query(
                                        options: QueryOptions(
                                            document: gql(TypeGraphql),

                                            ),
                                            
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

                                          final listItems3 = result.data?['all_property_types'];
                                         // setTypeId(listItems3['id']);


                                          return (DropdownInput(
                                              '${LocalizationHelper.of(context)!.t_type}',
                                              listItems3,
                                              'name',
                                              'id',
                                              setTypeId));
                                        }),
                                    const Spacing(40),
                                    NumInput(
                                        
                                            '${LocalizationHelper.of(context)!.t_personNumber}', box.get('individuals'),
                                         setNbPerson),
                                    const Spacing(40),
                                    NumInput(
                                        
                                            '${LocalizationHelper.of(context)!.t_area}', box.get('area') ,
                                         setSurface),
                                    const Spacing(40),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: ListView(
                                          shrinkWrap: true,
                                        
                                          children: [
                                            CustomCheckbox('${LocalizationHelper.of(context)!.t_garden}', box.get('has_garden') ??false, setHasGarden),
                                            CustomCheckbox('${LocalizationHelper.of(context)!.t_garage}', box.get('has_garage')??false, setHasGarage),
                                            CustomCheckbox('${LocalizationHelper.of(context)!.t_sheepfold}', box.get('has_sheepfold')??false, setHasSheepfold),
                                            CustomCheckbox('${LocalizationHelper.of(context)!.t_residence}', box.get('has_residence')??false, setHasResidence),
                                            CustomCheckbox('${LocalizationHelper.of(context)!.t_address}', box.get('has_adress')?? false, setHasAdress),

                                          ],
                                        ))
                                  ]))))
                ]))));
  }
}
