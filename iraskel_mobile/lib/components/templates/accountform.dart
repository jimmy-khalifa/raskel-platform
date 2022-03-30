import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iraskel_mobile/auth_graphql_client.dart';
import 'package:iraskel_mobile/components/atoms/_customcircularprogress.dart';
import 'package:iraskel_mobile/components/atoms/_custominputwithddefaultvalue.dart';
import 'package:iraskel_mobile/components/atoms/_graphbuttonforimage.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/atoms/_text.dart';
import 'package:iraskel_mobile/components/atoms/datefield.dart';
import 'package:iraskel_mobile/components/molecules/_profilewidget.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';
//import 'package:http/http.dart' as http;
//import 'package:http_parser/http_parser.dart';
import 'package:http_parser/http_parser.dart';

import 'package:path/path.dart';

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

//MODIFIED
const String producerByUser = r'''
  query{
  producer_by_user{
    id
    first_name
    last_name
    date_of_birth
    age
    phone_number
    email
    cin
    cin_delivery
    is_principal	
    user {
      username
    }
  }
}
''';

const imageProfile = """
mutation (\$image: Upload!){
  uploadUserImage(image: \$image)
}
""";

class AccountForm extends StatefulWidget {
  final bool enabled;
  final bool readonly;
  final bool enable;

  // ignore: use_key_in_widget_constructors
  const AccountForm(this.enabled, this.readonly, this.enable);

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
  bool loading = false;
  TextEditingController cindateinput = TextEditingController();
  TextEditingController birthDate = TextEditingController();

  late String phone;
  late String lastname;
  late String firstname;
  late String id;
  void mutationProducer() async {}

  void initQuery() async {
    final QueryOptions options = QueryOptions(
      document: gql(producerByUser),
    );

    setLoading(true);
    final QueryResult result =
        await AuthGraphQLClient.getClient(null).query(options);

    setLoading(false);

    if (result.hasException) {
      // ignore: avoid_print
      print(result.exception.toString());
    } else {
      final prod = result.data?['producer_by_user'];
      setPhoneNumber(prod['phone_number']);
      setLastName(prod['last_name']);
      setFirstName(prod['first_name']);
      setUserName(prod['user']['username']);
      setProdId(prod['id']);
      setAge(prod['age']);
      setNumCIN(prod['cin']);
      setCinDate(prod['cin_delivery']);
      setBirthDate(prod['date_of_birth']);
    }
  }

  //late Future<String?> municipality;
  @override
  void initState() {
    cindateinput.text = ""; //set the initial value of text field
    birthDate.text = "";
    super.initState();
    initQuery();
  }

  setCinDate(value) {
    setState(() {
      cindateinput.text = value;
      late final Box box = Hive.box('auth');
      box.put('DeliveryCinDate', value);
    });
  }

  setBirthDate(value) {
    setState(() {
      birthDate.text = value;
      late final Box box = Hive.box('auth');
      box.put('BirthdayDate', value);
    });
  }

  setUserName(value) {
    setState(() {
      username = value;
      late final Box box = Hive.box('auth');
      box.put('username', value);
    });
  }

  setFirstName(value) {
    setState(() {
      firstName = value;
      late final Box box = Hive.box('auth');
      box.put('firstName', value);
    });
  }

  setLastName(value) {
    setState(() {
      lastName = value;
      late final Box box = Hive.box('auth');
      box.put('lastName', value);
    });
  }

  setProdId(value) {
    setState(() {
      id = value;
    });
    late final Box box = Hive.box('auth');
    box.put('ProducerId', value);
  }

  setPhoneNumber(value) {
    setState(() {
      phoneNumber = value;
    });
    late final Box box = Hive.box('auth');
    box.put('phone', value);
  }

  setNumCIN(value) {
    setState(() => {numCIN = value});
    late final Box box = Hive.box('auth');
    box.put('Cin', value);
  }

  setAge(value) {
    setState(() => {age = value});
    late final Box box = Hive.box('auth');
    box.put('Age', value);
  }

  setLoading(value) {
    setState(() {
      loading = value;
    });
  }

  // ignore: prefer_typing_uninitialized_variables
  var _image;

  final imagePicker = ImagePicker();
  // ignore: duplicate_ignore
  Future getImage() async {
    // ignore: deprecated_member_use
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    //getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image!.path);
      //File(image!.path);
    });
  }

  // ignore: prefer_typing_uninitialized_variables

  String fileName = "";

  final ImagePicker cinsImage = ImagePicker();
  List<XFile> cinList = [];
  List<String> fileNames = [];
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _images;
  // ignore: prefer_typing_uninitialized_variables
  var index;
  void selectcinImage() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      cinList.addAll(selectedImages);
    }
    _uploadFile(selectedImages);
    // print("Image List Length:" + cinList.length.toString());

    setState(() {
      _images = File(cinList[index].path);
    });
  }

  void _uploadFile(filePath) async {
    //String fileName = basename(filePath.path);
    //return Text('$fileName');
    setState(() {
      for (var element in cinList) {
        fileName = basename(element.path);
        fileNames.add(fileName);
      }
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
        body: Card(
            color: loading ? Colors.grey.shade100 : Colors.white,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
                left: MediaQuery.of(context).size.width / 25,
                right: MediaQuery.of(context).size.width / 25,
                bottom: MediaQuery.of(context).size.height / 45),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: loading
                ? const Center(child: CustomCircularProgressIndicator())
                : Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 50,
                        left: MediaQuery.of(context).size.width / 25,
                        right: MediaQuery.of(context).size.width / 25,
                        bottom: MediaQuery.of(context).size.height / 45),
                    child: Column(children: [
                      FormHeader(
                          headerText:
                              '${LocalizationHelper.of(context)!.t_account}'),
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
                                    _image == null
                                        ? ProfileWidget(
                                            'assets/images/profile.png',
                                            username,
                                            30.0)
                                        : Column(children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              child: Image.file(
                                                _image,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    6,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                              ),
                                            ),
                                            Center(
                                                child: CustomText(username,
                                                    FontWeight.w300, 30.0))
                                          ]),

                                    modified
                                        ? Button(
                                            '${LocalizationHelper.of(context)!.t_update}',
                                            onpressed,
                                          )
                                        : Mutation(
                                            options: MutationOptions(
                                              document: gql(imageProfile),
                                              onCompleted: (d) {},
                                              update: (cache, results) {
                                                var message = results!.hasException
                                                    ? '${results.exception}'
                                                    : "Image was uploaded successfully!";

                                                final snackBar = SnackBar(
                                                    content: Text(message));
                                                Scaffold.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                            ),
                                            builder: (RunMutation? runMutation,
                                                QueryResult? result) {
                                              return OutlineButton(
                                               child: Text('upload'),
                                                onPressed: () {
                                                  var byteData =
                                                      _image.readAsBytesSync();

                                                  var multipartFile =
                                                      MultipartFile.fromBytes(
                                                    'photo',
                                                    byteData,
                                                    filename:
                                                        '${DateTime.now().second}.jpg',
                                                    contentType: MediaType(
                                                        "image", "jpg"),
                                                  );

                                                  runMutation!(<String,
                                                      dynamic>{
                                                    "file": multipartFile,
                                                  });
                                                },
                                              );
                                            },
                                          ),

                                    /*   GraphqlButtonforImage(
                                            '${LocalizationHelper.of(context)!.t_upload}',
                                            false,
                                            imageProfile,
                                            {"image": _image},
                                            MediaQuery.of(context).size.width /
                                                30,
                                            MediaQuery.of(context).size.height /
                                                80,
                                          ),*/
                                    const Spacing(40),

                                    //  CustomInput('@ffoulen', setUserName,),
                                    CustomInputWithDefaultValue(
                                        '${LocalizationHelper.of(context)!.t_username}',
                                        setUserName,
                                        username,
                                        widget.enabled,
                                        widget.readonly,
                                        widget.enable),
                                    const Spacing(40),
                                    CustomInputWithDefaultValue(
                                        '${LocalizationHelper.of(context)!.t_lastname}',
                                        setFirstName,
                                        firstName,
                                        widget.enabled,
                                        widget.readonly,
                                        widget.enable),
                                    const Spacing(40),
                                    CustomInputWithDefaultValue(
                                        '${LocalizationHelper.of(context)!.t_firstname}',
                                        setLastName,
                                        lastName,
                                        widget.enabled,
                                        widget.readonly,
                                        widget.enable),
                                    const Spacing(40),
                                    CustomInputWithDefaultValue(
                                        '${LocalizationHelper.of(context)!.t_phone}',
                                        setPhoneNumber,
                                        phoneNumber,
                                        widget.enabled,
                                        widget.readonly,
                                        widget.enable),
                                    // PhoneField(setPhoneNumber),

                                    const Spacing(40),
                                    CustomInputWithDefaultValue(
                                        '${LocalizationHelper.of(context)!.t_identity_card}',
                                        setNumCIN,
                                        numCIN,
                                        numCIN.length < 8 ? true : false,
                                        numCIN.length < 8 ? false : true,
                                        numCIN.length < 8 ? true : false),
                                    /* NumInput(
                                        hinttext:
                                            '${LocalizationHelper.of(context)!.t_identity_card}',
                                        setter: setNumCIN),*/
                                    const Spacing(40),
                                    DateField(
                                      dateinput: cindateinput,
                                      hinttext:
                                          '${LocalizationHelper.of(context)!.t_delivery_date}',
                                    ),
                                    const Spacing(40),
                                    IconButton(
                                      onPressed: () {
                                        //getCinImage();
                                        selectcinImage();
                                      },
                                      icon: const Icon(
                                        FeatherIcons.uploadCloud,
                                        size: 30,
                                      ),
                                    ),
                                    /* _file!=null ? Column(children: [
                                    Image.file(
                                              _file,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /8
                                            ),
                                            // ignore: unnecessary_string_interpolations
                                            Text('$fileName')

                              
                                  ],) : const Text('Pas d"image sélectionnée'),*/
                                    cinList.isEmpty
                                        ? const Text('pas d"image')
                                        : Column(children: [
                                            /* SizedBox(
                                                height: 100.0,
                                                width: 100.0,
                                                child: GridView.builder(
                                                    itemCount: 2,
                                                    gridDelegate:
                                                    const    SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 3),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Image.file(File(
                                                          cinList[index].path));
                                                    })),*/
                                            // ignore: unnecessary_string_interpolations
                                            Text('${fileNames[0]}'),
                                            // ignore: unnecessary_string_interpolations
                                            Text('${fileNames[1]}')
                                          ]),
                                    const Spacing(40),

                                    DateField(
                                      dateinput: birthDate,
                                      hinttext:
                                          '${LocalizationHelper.of(context)!.t_birth}',
                                    ),
                                    const Spacing(40),
                                    CustomInputWithDefaultValue(
                                        '${LocalizationHelper.of(context)!.t_age}',
                                        setAge,
                                        age,
                                        age.length < 2 ? true : false,
                                        age.length < 2 ? false : true,
                                        age.length < 2 ? true : false),
                                  ],
                                ),
                              ))),
                    ]))));
  }
}
