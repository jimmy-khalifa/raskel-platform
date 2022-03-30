import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/atoms/_text.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

import '../../auth_graphql_client.dart';

const bin = """
query(\$binId: ID!){
	bin(binId:\$binId){
		id
		type{
			id
			name
		}
		brand{
			id
			name
		}
	}
}
""";
const property= """
query(\$propertyId:ID!){
	property(propertyId:\$propertyId){
		id
		type{
			id
			name
		}
	}
}
""";

class ConfirmationInfo extends StatefulWidget {
  const ConfirmationInfo({Key? key}) : super(key: key);

  @override
  _ConfirmationInfoState createState() => _ConfirmationInfoState();
}

class _ConfirmationInfoState extends State<ConfirmationInfo> {
  late final Box box = Hive.box('auth');
  bool loading = false;

  setLoading(value) {
    setState(() {
      loading = value;
    }); 
  }
  void initBinQuery()async{
    final QueryOptions options = QueryOptions(
        document: gql(bin),
        variables: {"binId": box.get("BinId")}
        );
    setLoading(true);
    final QueryResult result =
        await AuthGraphQLClient.getClient(null).query(options);

    setLoading(false);

    if (result.hasException) {
      // ignore: avoid_print
      print(result.exception.toString());
    } else {
      // ignore: non_constant_identifier_names
      final bin_id = result.data?['bin'];
      setBinType(bin_id['type']['name']);
      setBinBrand(bin_id['brand']['name']);
    }

  }
  void initPropertyQuery() async{
    final QueryOptions options = QueryOptions(
        document: gql(property),
        variables: {"propertyId": box.get("PropertyId")}
        );
    setLoading(true);
    final QueryResult result =
        await AuthGraphQLClient.getClient(null).query(options);

    setLoading(false);

    if (result.hasException) {
      // ignore: avoid_print
      print(result.exception.toString());
    } else {
      // ignore: non_constant_identifier_names
      final property_id = result.data?['property'];
      setPropertyType(property_id['type']['name']);
     
    }


  }
   late String brandName = "" ;
  late String typeName = "" ;
  late String propertyTypeName = "";
  setBinBrand(value){
    setState(() {
      brandName = value;
      box.put("binBrandName",value);
    });
  }
  setBinType(value){
    setState(() {
      typeName = value;
      box.put("binTypeName",value);
    });
  }
  setPropertyType(value){
    setState(() {
      propertyTypeName=value;
      box.put("propertyTypeName",value);
    });
  }

  @override
  void initState(){
    super.initState();
    initBinQuery();
    initPropertyQuery();
  }
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigTitle(
                                '${LocalizationHelper.of(context)!.t_personal_information}',
                                20),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_username}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_firstname}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_lastname}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_phone}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_birth}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_age}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_identity_card}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_delivery_date}:",
                                FontWeight.w700,
                                15),
                            const Spacing(20),
                            BigTitle(
                                '${LocalizationHelper.of(context)!.t_address}',
                                20),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_country}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_state}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_municipality}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_district}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_postal_code}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_principaladress}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_complementeryadrress}:",
                                FontWeight.w700,
                                15),
                            const Spacing(20),
                            BigTitle(
                                '${LocalizationHelper.of(context)!.t_property}',
                                20),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_type}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_personNumber}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_area}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                " ${LocalizationHelper.of(context)!.t_garden}",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_garage}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                " ${LocalizationHelper.of(context)!.t_sheepfold}:",
                                FontWeight.w700,
                                15),
                            const Spacing(20),
                            BigTitle(
                                '${LocalizationHelper.of(context)!.t_bac}',
                                20),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_type}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_brand}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_size}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_volume}:",
                                FontWeight.w700,
                                15),
                            CustomText(
                                "${LocalizationHelper.of(context)!.t_color}:",
                                FontWeight.w700,
                                15),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const BigTitle(
                                '',
                                20),
                            CustomText(
                                box.get("username"),
                                FontWeight.w700,
                                15),
                            CustomText(
                                 box.get("lastName"),
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get("firstName"),
                                FontWeight.w700,
                                15),
                            CustomText(
                               box.get("phone"),
                                FontWeight.w700,
                                15),
                            CustomText(
                                 box.get("BirthdayDate"),
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get("Age"),
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get("Cin"),
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get("DeliveryCinDate"),
                                FontWeight.w700,
                                15),
                            const Spacing(20),
                            const BigTitle(
                                '',
                                20),
                            CustomText(
                              "${LocalizationHelper.of(context)!.t_Tunis}",
                                FontWeight.w700,
                                15),
                            CustomText(
                                 box.get("stateName"),
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get("municipalityName"),
                                FontWeight.w700,
                                15),
                           const CustomText(
                                "",
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get("postalCode"),
                                FontWeight.w700,
                                15),
                            CustomText( 
                       box.get("isprincipalAdress")==true ? " ${LocalizationHelper.of(context)!.t_yes}" : " ${LocalizationHelper.of(context)!.t_no}",
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get("complementaryADress"),
                                FontWeight.w700,
                                15),
                            const Spacing(20),
                            const BigTitle(
                                '',
                                20),
                            CustomText(
                               box.get("propertyTypeName"),
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get('individuals'),
                                FontWeight.w700,
                                15),
                            CustomText(
                               box.get('area'),
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get("has_garden")==true ? " ${LocalizationHelper.of(context)!.t_yes}" : " ${LocalizationHelper.of(context)!.t_no}",
                                FontWeight.w700,
                                15),
                            CustomText(
                               box.get("has_garage")==true ? " ${LocalizationHelper.of(context)!.t_yes}" : " ${LocalizationHelper.of(context)!.t_no}",
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get("has_sheepfold")==true ? " ${LocalizationHelper.of(context)!.t_yes}" : " ${LocalizationHelper.of(context)!.t_no}",
                                FontWeight.w700,
                                15),
                            const Spacing(20),
                            const BigTitle(
                                '',
                                20),
                            CustomText(
                                box.get('binTypeName'),
                                FontWeight.w700,
                                15),
                            CustomText(
                               box.get('binBrandName'),
                                FontWeight.w700,
                                15),
                            CustomText(
                               box.get('sizeBin'),
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get('volumeBin'),
                                FontWeight.w700,
                                15),
                            CustomText(
                                box.get('colorBin'),
                                FontWeight.w700,
                                15),
                          ],
                        ),
                      ],
                    )

                    /*
            
              
                 
                
                      const Spacing(20),
                  BigTitle( '${LocalizationHelper.of(context)!.t_property}', 20),
                Card(child: Column(
 box.get("has_sheepfold")==true ? " ${LocalizationHelper.of(context)!.t_yes}" : " ${LocalizationHelper.of(context)!.t_no}"),
                /*  RowInsideRow(
                      "Principale:",  "Non", " Adresse Principale:", box.get("has_adress") ? "Oui" :"Non"),*/

                ],
              )),*/
            
              
           
                    ))
          ]));
    }));
  }
}
