// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';

import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/atoms/multilineinput.dart';
import 'package:iraskel_mobile/components/atoms/numinput.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';
import 'package:latlong2/latlong.dart';
//import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

import '../../auth_graphql_client.dart';
import '../atoms/_custominputwithddefaultvalue.dart';

//import 'package:permission_handler/permission_handler.dart';

const adressByProducer = """
query(\$producerId :ID!){
  address_by_producer(producerId: \$producerId){
  	id
  	label
  	zipcode
  	district{
	  	code
	  	id
		  name
	}
	
}
	
}
""";

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
const companyByMunicipality = """
query(\$municipalityId: ID!){
  companies_by_municipality(municipalityId: \$municipalityId){
    
    id
    legal_name
  }
}
""";
const state = """
query(\$stateId: ID!){
	state(stateId:\$stateId){
		id
		name
	}
}
""";
const municipalityID = """
query(\$municipalityId: ID!){
	municipality(municipalityId:\$municipalityId){
		id
		name
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
  late String companyId = "";
  late String id = "";
  late String complementaryAdress = "";
  late bool isprincipalAdress = false;
  late bool isSpatial = false;

  bool isChecked = false;
  LatLng point = LatLng(33.984250, 8.216120);
  bool loading = false;

  setLoading(value) {
    setState(() {
      loading = value;
    });
  }

  void municipalityQuery() async {
    final QueryOptions options = QueryOptions(
        document: gql(municipalityID),
        variables: {"municipalityId": box.get("municipalityId")});
    setLoading(true);
    final QueryResult result =
        await AuthGraphQLClient.getClient(null).query(options);

    setLoading(false);

    if (result.hasException) {
      // ignore: avoid_print
      print(result.exception.toString());
    } else {
      // ignore: non_constant_identifier_names
      final municipality_id = result.data?['municipality'];
      setMunicipalityName(municipality_id['name']);

      //  setAdressId(int.parse(adressquery['id']));
      // print("adress :${id}");
    }
  }

  void stateQuery() async {
    final QueryOptions options = QueryOptions(
        document: gql(state), variables: {"stateId": box.get("stateId")});
    setLoading(true);
    final QueryResult result =
        await AuthGraphQLClient.getClient(null).query(options);

    setLoading(false);

    if (result.hasException) {
      // ignore: avoid_print
      print(result.exception.toString());
    } else {
      // ignore: non_constant_identifier_names
      final state_id = result.data?['state'];
      setStateName(state_id['name']);
    }
  }

  late String municipalityName = "";
  late String stateName = "";
  setMunicipalityName(value) {
    setState(() {
      municipalityName = value ?? "";
      box.put("municipalityName", value ?? "");
    });
  }

  setStateName(value) {
    setState(() {
      stateName = value;
      box.put("stateName", value);
    });
  }

  //var locationMessage = "";
  List<Placemark> placemarks = [];
  //late Position _currentPosition;
  // String _currentAddress = "";
  late LatLng currentPostion;
  @override
  void initState() {
    getCurrentLocation();
    municipalityQuery();
    stateQuery();

    super.initState();
    // initQuery();
  }

  setAdressId(value) {
    setState(() {
      id = value;
    });
    box.put('adressId', value);
  }

  setIsPrincipalADress(value) {
    setState(() {
      isprincipalAdress = value;
    });
    box.put('isprincipalAdress', value);
  }

  setComplementaryADress(value) {
    setState(() {
      complementaryAdress = value ?? "";
    });
    box.put('complementaryADress', value ?? "");
  }
  final formKey = GlobalKey<FormState>();

  void getCurrentLocation() async {
    //  try {
    // ignore: unused_local_variable
    LocationPermission permission = await Geolocator.requestPermission();

    var position = await Geolocator.getCurrentPosition(
        //  forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPostion = LatLng(position.latitude, position.longitude);
      point = currentPostion;
      // print("currentposition $currentPostion");
    });
    box.put('lat', currentPostion.latitude);
    box.put('long', currentPostion.longitude);

    if (currentPostion.latitude != null && currentPostion.longitude != null) {
      isSpatial = true;
    } else {
      isSpatial = false;
    }
    box.put('isSpatial', isSpatial);
  }

  late final Box box = Hive.box('auth');

  setCodePostal(value) {
    setState(() {
      codePostal = value  ?? "";
      box.put("codePostal", value ?? ""  );
    });
    
  }

  var infoWindowVisible = false;

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
                          '${LocalizationHelper.of(context)!.t_address}'),
                  Expanded(
                      child: SingleChildScrollView(
                          primary: false,
                          padding: EdgeInsets.zero,
                          reverse: false,
                           child: Form(
                                key: formKey,
                          child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // Text(id),

                                    CustomInputWithDefaultValue(
                                        '${LocalizationHelper.of(context)!.t_state}',
                                        setStateName,
                                  box.get("stateName")   ??   stateName,
                                        false,
                                        true,
                                        false),
                                    const Spacing(40),
                                    CustomInputWithDefaultValue(
                                        '${LocalizationHelper.of(context)!.t_municipality}',
                                        setMunicipalityName,
                                    box.get("municipalityName")??    municipalityName,
                                        false,
                                        true,
                                        false),
                                    const Spacing(40),
                                    MultiLineInput(
                                        hinttext:
                                            '${LocalizationHelper.of(context)!.t_complementeryadrress}',
                                        initialvalue:
                                            box.get('complementaryADress') ??
                                                complementaryAdress,
                                        setter: setComplementaryADress),
                                    const Spacing(40),
                                    CustomInputWithDefaultValue(
                                        '${LocalizationHelper.of(context)!.t_postal_code}',
                                         setCodePostal,
                                        box.get("codePostal") ??codePostal,
                                       true,false,true),
                                    CheckboxListTile(
                                        activeColor: const Color(0xFF65C88D),
                                        value: box.get('isprincipalAdress') ??
                                            isChecked,
                                        onChanged: (bool? value) {
                                          setIsPrincipalADress(value);
                                        },
                                        title: Text(
                                            '${LocalizationHelper.of(context)!.t_principaladress}',
                                            style: GoogleFonts.tajawal(
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: Color(0xFF393E41)))),
                                        controlAffinity:
                                            ListTileControlAffinity.leading),
                                    const Spacing(20),

                                    SizedBox(
                                      height: 400,
                                      width: 400,
                                      child: Stack(
                                        children: [
                                          FlutterMap(
                                              options: MapOptions(
                                                  plugins: [
                                                    MarkerClusterPlugin()
                                                  ],
                                                  onTap: (_, p) async {
                                                    placemarks =
                                                        await placemarkFromCoordinates(
                                                            p.latitude,
                                                            p.longitude);
                                                    setState(() {
                                                      point = p;
                                                    });
                                                  },
                                                  enableScrollWheel: true,
                                                  enableMultiFingerGestureRace:
                                                      true,
                                                  allowPanning: true,
                                                  center: LatLng(
                                                      33.921452, 8.129640),
                                                  zoom: 10.0),
                                              layers: [
                                                TileLayerOptions(
                                                  urlTemplate:
                                                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                                  // ?source=${DateTime.now().millisecondsSinceEpoch}
                                                  subdomains: ['a', 'b', 'c'],
                                                ),
                                                MarkerClusterLayerOptions(
                                                    markers: [
                                                      Marker(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        point: point,
                                                        builder: (ctx) =>
                                                            const Icon(
                                                                Icons
                                                                    .location_on,
                                                                color:
                                                                    Colors.red,
                                                                size: 40.0),
                                                      )
                                                    ],
                                                    builder:
                                                        (context, markers) {
                                                      return Container();
                                                    },
                                                    popupOptions: PopupOptions(
                                                      popupBuilder:
                                                          (_, markers) =>
                                                              Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 100,
                                                        width: 150,
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .rectangle),
                                                        child: Text(
                                                          placemarks.isEmpty
                                                              ? " "
                                                              : "${placemarks.first.country},${placemarks.first.locality},${placemarks.first.name},${placemarks.first.postalCode}",
                                                          textDirection:
                                                              TextDirection.ltr,
                                                        ),
                                                      ),
                                                    )),

                                                /*  MarkerLayerOptions(
                                                  markers: [
                                                    Marker(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        point: point,
                                                        builder: (ctx) => 
                                                                Icon(
                                                                    Icons
                                                                        .location_on,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 40.0),
                                                             
                                                            )
                                                  ],
                                                ),*/
                                              ]),
                                          Positioned(
                                            bottom: 20,
                                            right: 10,
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  splashColor: const Color(
                                                      0xFF65C88D), // Splash color
                                                  onTap: () {
                                                    getCurrentLocation();
                                                  },

                                                  child: const SizedBox(
                                                      width: 56,
                                                      height: 56,
                                                      child: Icon(
                                                          Icons.my_location,
                                                          color: Colors.black,
                                                          size: 30.0)),
                                                ),
                                              ),
                                            ),
                                          ),

                                          /*   Positioned(
                                              bottom: 10.0,
                                              left: 10.0,
                                              child: Card(
                                                color: placemarks.isEmpty
                                                    ? Color.fromARGB(
                                                        100, 22, 44, 33)
                                                    : Colors.white,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Text(placemarks.isEmpty
                                                      ? " "
                                                      : "${placemarks.first.country},${placemarks.first.locality},${placemarks.first.name},${placemarks.first.postalCode}"),
                                                ),
                                              ))*/
                                        ],
                                      ),
                                    ),
                                    //  Text('Position: $locationMessage'),
                      ]))))),
                ]))));
  }
}
