import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iraskel_mobile/auth_graphql_client.dart';

import 'package:iraskel_mobile/components/atoms/_dotstepper.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/confirmationinfo.dart';
import 'package:iraskel_mobile/components/templates/accountform.dart';
import 'package:iraskel_mobile/components/templates/addressform.dart';
import 'package:iraskel_mobile/components/templates/bacform.dart';
import 'package:iraskel_mobile/components/templates/propertiesform.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

const updateProducer = """
mutation(\$input: ProducerInput!){
 modify_producer(input: \$input){
    modified
		
    producer {
      id
      first_name
			age
			last_name
			date_of_birth
			phone_number
			cin
			cin_delivery
			properties{
				type{
					code
				}
				
			}
			
			
			
    }
  }
}
""";
const producerByUser = """
query{
  producer_by_user{
    id
    first_name
    last_name
		date_of_birth
		email
		phone_number
		cin
		cin_delivery
		date_of_birth
		
		
	
  }
}
""";
const modifyProperty = """
mutation (\$input:PropertyInput!){
	modify_property(input:\$input){
		modified
		property{
			id
		
		}
	}
}
""";
const createProperty = """
mutation (\$input: PropertyCreateInput!){
  create_property(input: \$input){
    created
    property{
      id
      individuals
    }
  }
}
""";
const createBin = """
mutation(\$input:BinCreateInput!){
	create_bin(input:\$input){
		created
		err
		bin{
			id
			size
		}
	}
}
""";
const modifyBin = """
mutation(\$input:BinInput!){
	modify_bin(input:\$input){
		err
		modified
		bin{
			id
		}
	}
}

""";
const modifyAdress = """
mutation(\$input: AddressInput!) {
  modify_address(input: \$input) {
    address {
      id
      label
      latlong {
        x
        y
      }
      zipcode
    }
  }
}
""";

class HomePage extends StatefulWidget {
//  final Map<String, dynamic> user;
  // final bool visible;

  // ignore: use_key_in_widget_constructors
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  oncompleted() {
    // final SharedPreferences prefs = await _prefs;
    // prefs.setString('id', data["producer_by_user"]["id"]);

    setState(() {
      activestep++;
    });
    //  Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  late bool isConfirmed = false;
  late bool isVerified = false;
  late String cin = "";
  late String age = "";
  late String birthdate = "";
  late String cinDate = "";
  late String prodId = "";

  late final Box box = Hive.box('auth');
  void initHiveState() async {
    isConfirmed = box.get('isConfirmed');
    isVerified = box.get('isVerified');
    cin = box.get('Cin');
    age = box.get('Age');
    birthdate = box.get('BirthdayDate');
    prodId = box.get('ProducerId');
    cinDate = box.get('DeliveryCinDate');
  }

  @override
  void initState() {
    super.initState();
    initHiveState();
  }

  int activestep = 0;
  int dotcount = 5;
  final screens = [
    const AccountForm(false, true, false),
    const AddressForm(),
    const PropertiesForm(),
    const BacForm(),
    const ConfirmationInfo()
  ];
  onpressed() async {
    /* if (activestep < dotcount - 1) {
      setState(() {
        activestep++;
      });*/
    if (activestep == 0) {
      final MutationOptions options = MutationOptions(
        document: gql(updateProducer),
        variables: {
          "input": {
            "id": box.get('ProducerId'),
            "cin": box.get('Cin'),
            "cin_delivery": "2012-05-25",
            "date_of_birth": "1999-06-19",
            "age": box.get('Age')
          }
        },
      );
      final QueryResult result =
          await AuthGraphQLClient.getClient(null).mutate(options);
      if (result.hasException) {
        //  print("erreur");
      } else {
        // ignore: non_constant_identifier_names, unused_local_variable
        final modified_prod = result.data?["modify_producer"];
        // print(modified_prod['producer']['id']);
      }
    } else if (activestep == 1) {
      final MutationOptions options =
          MutationOptions(document: gql(modifyAdress), variables: {
        "input": {
          "id": box.get('ProducerId'),
          "label": box.get('complementaryADress') ?? "",
          "zipcode": box.get('postalCode'),
          "is_spatial": box.get('isSpatial'),
          "latitude": box.get('lat') ?? "",
          "longitude": box.get('long') ?? "",
          "district_id": null
        }
      });
      final QueryResult result =
          await AuthGraphQLClient.getClient(null).mutate(options);
      if (result.hasException) {
        // ignore: avoid_print
        print("erreur");
      } else {
        // ignore: non_constant_identifier_names
        final modified_adress = result.data?["modify_address"];
        // ignore: avoid_print
        print(modified_adress['address']['id']);
      }
    } else if (activestep == 2) {
      if (box.get('PropertyId').isEmpty) {
        final MutationOptions options = MutationOptions(
          document: gql(createProperty),
          variables: {
            "input": {
              "area": double.parse(box.get('area')),
              "individuals": int.parse(box.get('individuals')),
              "has_garden": box.get('has_garden') ?? false,
              "has_garage": box.get('has_garage') ?? false,
              "has_barn": box.get('has_sheepfold') ?? false,
              "typeId": box.get('typeId'),
              "producerId": box.get('ProducerId')
            }
          },
        );
        final QueryResult result =
            await AuthGraphQLClient.getClient(null).mutate(options);
        if (result.hasException) {
          // ignore: avoid_print
          print("erreur");
        } else {
          // ignore: non_constant_identifier_names, unused_local_variable
          final created_prop = result.data?["modify_property"];
          // ignore: avoid_print
          //  print(modified_prop['property']['id']);
        }
      } else {
        final MutationOptions options = MutationOptions(
          document: gql(modifyProperty),
          variables: {
            "input": {
              "id": box.get('PropertyId'),
              "area": double.parse(box.get('area')),
              "individuals": int.parse(box.get('individuals')),
              "has_garden": box.get('has_garden') ?? false,
              "has_garage": box.get('has_garage') ?? false,
              "has_barn": box.get('has_sheepfold') ?? false,
              "typeId": box.get('typeId'),
              "producerId": box.get('ProducerId')
            }
          },
        );
        final QueryResult result =
            await AuthGraphQLClient.getClient(null).mutate(options);
        if (result.hasException) {
          // ignore: avoid_print
          print("erreur");
        } else {
          // ignore: non_constant_identifier_names, unused_local_variable
          final modified_prop = result.data?["modify_property"];
          // ignore: avoid_print
          //  print(modified_prop['property']['id']);
        }
      }
    } else if (activestep == 3) {
      if (box.get('BinId').isEmpty) {
        final MutationOptions options =
            MutationOptions(document: gql(createBin), variables: {
          "input": {
            "producerId": box.get('ProducerId'),
            "typeId": box.get('binTypeId'),
            "brandId": box.get('binBrandId'),
            "volume": double.parse(box.get('volumeBin')),
            "size": box.get('sizeBin'),
            "color": box.get('colorBin')
          }
        });
        final QueryResult result =
            await AuthGraphQLClient.getClient(null).mutate(options);
        if (result.hasException) {
          //  print("erreur");
        } else {
          // ignore: non_constant_identifier_names, unused_local_variable
          final created_bin = result.data?["create_bin"];
          // print(modified_prod['producer']['id']);
        }
      } else {
        final MutationOptions options =
            MutationOptions(document: gql(modifyBin), variables: {
          "input": {
            "id": box.get('BinId'),
            "producerId": box.get('ProducerId'),
            "typeId": box.get('binTypeId'),
            "brandId": box.get('binBrandId'),
            "volume": double.parse(box.get('volumeBin')),
            "size": box.get('sizeBin'),
            "color": box.get('colorBin')
          }
        });
        final QueryResult result =
            await AuthGraphQLClient.getClient(null).mutate(options);
        if (result.hasException) {
          //  print("erreur");
        } else {
          // ignore: non_constant_identifier_names, unused_local_variable
          final modified_bin = result.data?["modify_bin"];
          // print(modified_prod['producer']['id']);
        }
      }
    } else if (activestep + 1 == dotcount) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text('${LocalizationHelper.of(context)!.t_congrats}'),
                // content: ,
              ));
    }

    setState(() {
      activestep++;
    });
    //Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  onBack() {
    if (activestep > 0) {
      setState(() {
        activestep--;
      });
    }
  }

  /* List<FAStep> _stepper =[
    FAStep(content:CompteForm() )
  ];*/
  @override
  Widget build(BuildContext context) {
    return (isConfirmed && !isVerified)
        ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Spacing(20),
            Expanded(
              child: IndexedStack(
                index: activestep,
                children: screens,
              ),
            ),
            // Padding(padding: const EdgeInsets.all(18.0), child: steps( )),

            StepDot(activestep, dotcount),
            Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [previousButton(), nextButton()],
                )),
          ])
        : const Text("error");
  }

  /// Returns the next button widget.
  Widget nextButton() {
    return IconButton(
        onPressed: onpressed,
        icon: const Icon(
          FeatherIcons.chevronsRight,
          color: Color(0xFF74c69d),
        ));
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return IconButton(
        onPressed: onBack,
        icon: const Icon(
          FeatherIcons.chevronsLeft,
          color: Color(0xFF74c69d),
        ));
  }
}
