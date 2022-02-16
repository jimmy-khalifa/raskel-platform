import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iraskel_mobile/components/atoms/_custominputwithddefaultvalue.dart';
import 'package:iraskel_mobile/components/atoms/_dropdowninputdecorator.dart';
import 'package:iraskel_mobile/components/atoms/_graphbuttonforimage.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_phonefield.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/atoms/datefield.dart';
import 'package:iraskel_mobile/components/atoms/numinput.dart';
import 'package:iraskel_mobile/components/molecules/_profilewidget.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http;
//import 'package:http_parser/http_parser.dart';

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
const producerByUser = """
query{
  producer_by_user{
    id
    first_name
   
		
		
	
  }
}
""";
const imageProfile = """
mutation (\$image: Upload!){
  uploadUserImage(image: \$image)
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
  late String? username = "";
  late String numCIN = "";
  late String age = "";
  TextEditingController cindateinput = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Future<String?> username2;
  late Future<String?> phone;
  late Future<String?> lastname;
  late Future<String?> firstname;
  late Future<String?> token;

  //late Future<String?> municipality;
  @override
  void initState() {
    cindateinput.text = ""; //set the initial value of text field
    birthDate.text = "";
    super.initState();
    username2 = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('username');
    });
    phone = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('phone_number');
    });
    lastname = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('lastname');
    });
    firstname = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('firstname');
    });
    token = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('token');
    });
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

  // ignore: prefer_typing_uninitialized_variables
  var _image;
  final imagePicker = ImagePicker();
  // ignore: duplicate_ignore
  Future getImage() async {
    // ignore: deprecated_member_use
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  late bool modified = true;

  onpressed() {
    getImage();
    modified = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<String?>(
            future: username2,
            builder: (BuildContext context, AsyncSnapshot<String?> user) {
              return FutureBuilder<String?>(
                  future: phone,
                  builder:
                      (BuildContext context, AsyncSnapshot<String?> phonenumb) {
                    return FutureBuilder<String?>(
                        future: lastname,
                        builder: (BuildContext context,
                            AsyncSnapshot<String?> last) {
                          return FutureBuilder<String?>(
                              future: firstname,
                              builder: (BuildContext context,
                                  AsyncSnapshot<String?> first) {
                                return FutureBuilder<String?>(
                                  future: token,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String?> tok) {
                                    return Card(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height /
                                                20,
                                            left: MediaQuery.of(context).size.width /
                                                25,
                                            right: MediaQuery.of(context).size.width /
                                                25,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                45),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    50,
                                                left: MediaQuery.of(context).size.width / 25,
                                                right: MediaQuery.of(context).size.width / 25,
                                                bottom: MediaQuery.of(context).size.height / 45),
                                            child: Column(children: [
                                              const FormHeader(
                                                  headerText: 'Compte'),
                                              Expanded(
                                                  child: SingleChildScrollView(
                                                      primary: false,
                                                      padding: EdgeInsets.zero,
                                                      reverse: false,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            _image == null
                                                                ? ProfileWidget(
                                                                    'assets/images/profile.png',
                                                                    user.data ??
                                                                        ' ',
                                                                    30.0)
                                                                : ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100.0),
                                                                    child: Image
                                                                        .file(
                                                                      _image,
                                                                      height:
                                                                          MediaQuery.of(context).size.height /
                                                                              6,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          4,
                                                                    ),
                                                                  ),

                                                            modified
                                                                ? Button(
                                                                    'modifier',
                                                                    onpressed,
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        30,
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        80,
                                                                  )
                                                                : /*Mutation(
                                                                    options:
                                                                        MutationOptions(
                                                                      document:
                                                                          gql(imageProfile),
                                                                      onCompleted:
                                                                          (d) {},
                                                                      update: (cache,
                                                                          result) {},

                                                                      //Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPage()));
                                                                    ),
                                                                    builder: (RunMutation?
                                                                            _runMutation,
                                                                        QueryResult?
                                                                            result) {
                                                                      var byteData =
                                                                          _image
                                                                              .readAsBytesSync();

                                                                      var multipartFile =
                                                                          http.MultipartFile
                                                                              .fromBytes(
                                                                        'photo',
                                                                        byteData,
                                                                        filename:
                                                                            '${DateTime.now().second}.jpg',
                                                                        contentType: MediaType(
                                                                            "image",
                                                                            "jpg"),
                                                                      );
                                                                      // ignore: prefer_function_declarations_over_variables
                                                                      final runMutation = () =>
                                                                          _runMutation!(<
                                                                              String,
                                                                              dynamic>{
                                                                            "image":
                                                                                multipartFile
                                                                          });
                                                                      return OutlinedButton(
                                                                          style: OutlinedButton
                                                                              .styleFrom(
                                                                            padding:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: MediaQuery.of(context).size.width / 30,
                                                                              horizontal: MediaQuery.of(context).size.height / 80,
                                                                            ),
                                                                            backgroundColor:
                                                                                Colors.white,
                                                                            side:
                                                                                const BorderSide(color: Color(0xFF65C88D)),
                                                                            shape:
                                                                                const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            runMutation();
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'upload',
                                                                            style: GoogleFonts.tajawal(
                                                                                textStyle: const TextStyle(
                                                                              color: Color(0xFF65C88D),
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 20.0,
                                                                            )),
                                                                          ));
                                                                    },
                                                                  ),*/
                                                                  GraphqlButtonforImage('upload', false, imageProfile, 
                                                                  {"image":_image},
                                                                   MediaQuery.of(context).size.width / 30,MediaQuery.of(context).size.height / 80,),

                                                            //  CustomInput('@ffoulen', setUserName,),
                                                            CustomInputWithDefaultValue(
                                                                '@ffoulen',
                                                                setUserName,
                                                                user.data ??
                                                                    ' '),
                                                            const Spacing(40),
                                                            CustomInputWithDefaultValue(
                                                                'Fouleni',
                                                                setFirstName,
                                                                first.data ??
                                                                    ' '),
                                                            const Spacing(40),
                                                            CustomInputWithDefaultValue(
                                                                'Foulen',
                                                                setLastName,
                                                                last.data ??
                                                                    ' '),
                                                            const Spacing(40),
                                                            PhoneField(
                                                              setPhoneNumber,
                                                            ),
                                                            //phonenumb.data ?? '' ),
                                                            const Spacing(40),

                                                            /* QueryDropDownGraphQl(widget.grahqlCode1, widget.dropdowntextinput1,
                widget.listItems1, widget.text1),*/
                                                            Query(
                                                                options: QueryOptions(
                                                                    document: gql(
                                                                        stateBYCountry),
                                                                    variables: {
                                                                      "countryId":
                                                                          "1"
                                                                    }),
                                                                builder: (QueryResult
                                                                        result,
                                                                    {fetchMore,
                                                                    refetch}) {
                                                                  if (result
                                                                      .hasException) {
                                                                    return Text(result
                                                                        .exception
                                                                        .toString());
                                                                  }
                                                                  if (result
                                                                      .isLoading) {
                                                                    return const Center(
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    );
                                                                  }

                                                                  final listItems1 =
                                                                      result.data?[
                                                                          'states_by_country'];
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
                                                                    document: gql(
                                                                        municipalities),
                                                                    variables: {
                                                                      "stateId":
                                                                          stateId
                                                                    }),
                                                                builder: (QueryResult
                                                                        result,
                                                                    {fetchMore,
                                                                    refetch}) {
                                                                  if (result
                                                                      .hasException) {
                                                                    return Text(result
                                                                        .exception
                                                                        .toString());
                                                                  }
                                                                  if (result
                                                                      .isLoading) {
                                                                    return const Center(
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    );
                                                                  }

                                                                  final listItems2 =
                                                                      result.data?[
                                                                          'municipality_by_state'];
                                                                  return (DropdownInput(
                                                                      '${LocalizationHelper.of(context)!.t_municipality}',
                                                                      listItems2,
                                                                      'name',
                                                                      'id',
                                                                      setMunicipalityId));
                                                                }),
                                                            const Spacing(40),
                                                            NumInput(
                                                                hinttext:
                                                                    'N° Carte identité',
                                                                setter:
                                                                    setNumCIN),
                                                            const Spacing(40),
                                                            DateField(
                                                              dateinput:
                                                                  cindateinput,
                                                              hinttext:
                                                                  'Date Délivré',
                                                            ),
                                                            const Spacing(40),
                                                            DateField(
                                                              dateinput:
                                                                  birthDate,
                                                              hinttext:
                                                                  'Date De Naissance',
                                                            ),
                                                            const Spacing(40),
                                                            NumInput(
                                                                hinttext: 'age',
                                                                setter: setAge),
                                                                      const Spacing(40),
                                          Query(
                                              options: QueryOptions(
                                                  document: gql(producerByUser),
                                                  ),
                                              builder: (QueryResult result,
                                                  {fetchMore, refetch}) {
                                                if (result.hasException) {
                                                  return Text(result.exception
                                                      .toString());
                                                }
                                                if (result.isLoading) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }

                                                final listItems8 = result.data?[
                                                    'producer_by_user'];
                                                return Text(listItems8['id']);
                                              }) 
                                                          ],
                                                        ),
                                                      )))
                                            ])));
                                  },
                                );
                              });
                        });
                  });
            }));
  }
}
