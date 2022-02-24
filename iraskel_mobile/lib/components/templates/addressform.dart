import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iraskel_mobile/components/atoms/_custominput.dart';
import 'package:iraskel_mobile/components/atoms/_dropdowninputdecorator.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/atoms/multilineinput.dart';
import 'package:iraskel_mobile/components/atoms/numinput.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';
import 'package:latlong2/latlong.dart';
//import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

//import 'package:permission_handler/permission_handler.dart';

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

class _AddressFormState extends State<AddressForm> with TickerProviderStateMixin {
  late String pays = "";
  late String stateId = "";
  late String municipalityId = "";
  late String codePostal = "";

  bool isChecked = false;
  LatLng point = LatLng(33.984250, 8.216120);

  var locationMessage = "";
  List<Placemark> placemarks = [];

  void getCurrentLocation() async {
    // ignore: unused_local_variable
    LocationPermission permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      locationMessage = "$position.latitude , $position.longitude";
    });
  }

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

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
     
      duration: const Duration(seconds: 20), vsync: this,
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                          '${LocalizationHelper.of(context)!.t_address}'),
                  Expanded(
                      child: SingleChildScrollView(
                          primary: false,
                          padding: EdgeInsets.zero,
                          reverse: false,
                          child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomInput(
                                      '${LocalizationHelper.of(context)!.t_country}',
                                      setPays,
                                    ),
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
                                            return  Center(
                                              child: CircularProgressIndicator(
                                                value: controller.value,
                                                semanticsLabel:
                                                    'Linear progress indicator',
                                              ),
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
                                            return  Center(
                                              child:
                                                  CircularProgressIndicator( value: controller.value,
                                                semanticsLabel:
                                                    'Linear progress indicator',),
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
                                    MultiLineInput(
                                        hinttext:
                                            '${LocalizationHelper.of(context)!.t_complementeryadrress}'),
                                    const Spacing(40),
                                    NumInput(
                                        hinttext:
                                            '${LocalizationHelper.of(context)!.t_postal_code}',
                                        setter: setCodePostal),
                                    CheckboxListTile(
                                        activeColor: const Color(0xFF65C88D),
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                        title: Text(
                                            '${LocalizationHelper.of(context)!.t_restconnected}',
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
                                                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png?source=${DateTime.now().millisecondsSinceEpoch}",
                                                    subdomains: [
                                                      'a',
                                                      'b',
                                                      'c'
                                                    ]),
                                                MarkerLayerOptions(
                                                  markers: [
                                                    Marker(
                                                      width: 80.0,
                                                      height: 80.0,
                                                      point: point,
                                                      builder: (ctx) =>
                                                          const Icon(
                                                              Icons.location_on,
                                                              color: Colors.red,
                                                              size: 40.0),
                                                    )
                                                  ],
                                                ),
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
                                          Positioned(
                                              bottom: 10.0,
                                              left: 10.0,
                                              child: Card(
                                                color: placemarks.isEmpty ? Color.fromARGB(100, 22, 44, 33) : Colors.white,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Text(placemarks.isEmpty
                                                      ? " "
                                                      : "${placemarks.first.country},${placemarks.first.locality},${placemarks.first.name},${placemarks.first.postalCode}"),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    //  Text('Position: $locationMessage'),
                                  ])))),
                ]))));
  }
}
