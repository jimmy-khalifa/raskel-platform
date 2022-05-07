// ignore_for_file: deprecated_member_use

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
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/atoms/_text.dart';
import 'package:iraskel_mobile/components/atoms/datefield.dart';
import 'package:iraskel_mobile/components/atoms/numinput.dart';
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
const imageCinFront = """
mutation (\$image: Upload!){
  uploadCinFront(cin_pic_front: \$image)
}
""";
const imageCinBack = """
mutation(\$image:Upload!){
	uploadCinBack(cin_pic_back:\$image)
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
  late final Box box = Hive.box('auth');
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
      // setCinDate(prod['cin_delivery']);
      // setBirthDate(prod['date_of_birth']);
    }
  }

  //late Future<String?> municipality;

  setCinDate(value) {
    setState(() {
      cindateinput.text = value ?? "";

      box.put('DeliveryCinDate', value ?? "");
    });
  }

  setBirthDate(value) {
    setState(() {
      birthDate.text = value;
    });
  }

  setUserName(value) {
    setState(() {
      username = value;

      box.put('username', value);
    });
  }

  setFirstName(value) {
    setState(() {
      firstName = value;

      box.put('firstName', value);
    });
  }

  setLastName(value) {
    setState(() {
      lastName = value;

      box.put('lastName', value);
    });
  }

  setProdId(value) {
    setState(() {
      id = value;
      box.put('ProducerId', value);
    });
  }

  setPhoneNumber(value) {
    setState(() {
      phoneNumber = value;
      box.put('phone', value);
    });
  }

  setNumCIN(value) {
    setState(() {
      numCIN = value ?? "";
      box.put('Cin', value ?? "");
    });
  }

  setAge(value) {
    setState(() {
      age = value ?? "";
      box.put('Age', value ?? "");
    });
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
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    //getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image!.path);
      //File(image!.path);
    });
  }

  // ignore: prefer_typing_uninitialized_variables
  var _cinFront;
  String cinfrontName = "";
  String cinbackName = "";
  // ignore: prefer_typing_uninitialized_variables
  var _cinBack;
  Future selectCinFront() async {
    final cinFront = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _cinFront = File(cinFront!.path);
      cinfrontName = basename(cinFront.path);
    });
  }

  Future selectCinBack() async {
    final cinBack = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _cinBack = File(cinBack!.path);
      cinbackName = basename(cinBack.path);
    });
  }

  late bool isSelectedFront = false;
  late bool isSelectedBack = false;
  @override
  void initState() {
    //final formKey = GlobalKey<FormState>();

    cindateinput.text = ""; //set the initial value of text field
    birthDate.text = "";
    super.initState();
    initQuery();
    
  }

  late bool isConfirmedCinFront = false;
  late bool isConfirmedCinBack = false;

  late bool modified = true;
  oncinfrontselected() {
    selectCinFront();
    isSelectedFront = true;
  }

  oncinbackselected() {
    selectCinBack();
    isSelectedBack = true;
  }

  onpressed() {
    getImage();
    modified = false;
  }

  setIsConfirmedCinFront(value) {
    setState(() {
      isConfirmedCinFront = value;
    });
  }

  setIsConfirmedCinBack(value) {
    setState(() {
      isConfirmedCinBack = value;
    });
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
                        child: ListView(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            shrinkWrap: true,
                            primary: false,
                            padding: EdgeInsets.zero,
                            reverse: false,
                            children: [
                             Container(
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
                                                      BorderRadius.circular(
                                                          100.0),
                                                  child: Image.file(
                                                    _image,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            6,
                                                    width:
                                                        MediaQuery.of(context)
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
                                                    var message = results!
                                                            .hasException
                                                        ? '${results.exception}'
                                                        : '${LocalizationHelper.of(context)!.t_success}';

                                                    final snackBar = SnackBar(
                                                        content: Text(message));
                                                    Scaffold.of(context)
                                                        .showSnackBar(snackBar);
                                                  },
                                                ),
                                                builder:
                                                    (RunMutation? runMutation,
                                                        QueryResult? result) {
                                                  return Button(
                                                    '${LocalizationHelper.of(context)!.t_upload}',
                                                    () {
                                                      var byteData = _image
                                                          .readAsBytesSync();

                                                      var multipartFile =
                                                          MultipartFile
                                                              .fromBytes(
                                                        'photo',
                                                        byteData,
                                                        filename:
                                                            '${DateTime.now().second}.jpg',
                                                        contentType: MediaType(
                                                            "image", "jpg"),
                                                      );

                                                      runMutation!(<String,
                                                          dynamic>{
                                                        "image": multipartFile,
                                                      });
                                                    },
                                                  );
                                                },
                                              ),
                                        const Spacing(40),
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
                                        const Spacing(40),
                                        CustomInputWithDefaultValue(
                                            '${LocalizationHelper.of(context)!.t_identity_card}',
                                            setNumCIN,
                                            numCIN,
                                            numCIN.length < 8 ? true : false,
                                            numCIN.length < 8 ? false : true,
                                            numCIN.length < 8 ? true : false),
                                        const Spacing(40),
                                        DateField(
                                          initialvalue:
                                              box.get("DeliveryCinDate") ??
                                                  "2022-01-01",
                                          valueName: 'DeliveryCinDate',
                                          dateinput: cindateinput,
                                          hinttext:
                                              '${LocalizationHelper.of(context)!.t_delivery_date}',
                                        ),
                                        const Spacing(40),
                                        InputDecorator(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              labelText:
                                                  '${LocalizationHelper.of(context)!.t_cin}',
                                            ),
                                            child: Column(
                                              // alignment: ,
                                              children: [
                                                CustomText(
                                                    '${LocalizationHelper.of(context)!.t_cin_front}',
                                                    FontWeight.w500,
                                                    15),
                                                const Spacing(50),
                                                isSelectedFront == false
                                                    ? IconButton(
                                                        onPressed: () {
                                                          oncinfrontselected();
                                                        },
                                                        icon: const Icon(
                                                            FeatherIcons
                                                                .uploadCloud,
                                                            size: 30,
                                                            color: Color(
                                                                0xFF65C88D)),
                                                      )
                                                    : ((isConfirmedCinFront ==
                                                            false)
                                                        ? Mutation(
                                                            options:
                                                                MutationOptions(
                                                                    document: gql(
                                                                        imageCinFront),
                                                                    onCompleted:
                                                                        (d) {},
                                                                    update: (cache,
                                                                        results) {
                                                                      var message = results!
                                                                              .hasException
                                                                          ? '${results.exception}'
                                                                          : '${LocalizationHelper.of(context)!.t_success}';

                                                                      final snackBar =
                                                                          SnackBar(
                                                                              content: Text(message));
                                                                      Scaffold.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              snackBar);
                                                                    }),
                                                            builder: (RunMutation?
                                                                    runMutation,
                                                                QueryResult?
                                                                    result) {
                                                              return (Button(
                                                                '${LocalizationHelper.of(context)!.t_confirmButton}',
                                                                () {
                                                                  setIsConfirmedCinFront(
                                                                      true);
                                                                  runMutation!(<
                                                                      String,
                                                                      dynamic>{
                                                                    "image":
                                                                        cinfrontName,
                                                                  });
                                                                },
                                                              ));
                                                            })
                                                        : const Icon(
                                                            Icons
                                                                .check_circle_outline,
                                                            color: Color(
                                                                0xFF65C88D),
                                                            size: 40,
                                                          )),
                                                const Spacing(40),
                                                _cinFront != null
                                                    ? Text(cinfrontName)
                                                    : Text(
                                                        '${LocalizationHelper.of(context)!.t_no_image_selected}'),
                                                const Spacing(20),
                                                CustomText(
                                                    '${LocalizationHelper.of(context)!.t_cin_back}',
                                                    FontWeight.w500,
                                                    15),
                                                const Spacing(50),
                                                isSelectedBack == false
                                                    ? IconButton(
                                                        onPressed: () {
                                                          oncinbackselected();
                                                        },
                                                        icon: const Icon(
                                                          FeatherIcons
                                                              .uploadCloud,
                                                          size: 30,
                                                          color:
                                                              Color(0xFF65C88D),
                                                        ),
                                                      )
                                                    : ((isConfirmedCinBack ==
                                                            false)
                                                        ? Mutation(
                                                            options:
                                                                MutationOptions(
                                                                    document: gql(
                                                                        imageCinBack),
                                                                    onCompleted:
                                                                        (d) {},
                                                                    update: (cache,
                                                                        results) {
                                                                      var message = results!
                                                                              .hasException
                                                                          ? '${results.exception}'
                                                                          : '${LocalizationHelper.of(context)!.t_success}';

                                                                      final snackBar =
                                                                          SnackBar(
                                                                              content: Text(message));
                                                                      Scaffold.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              snackBar);
                                                                    }),
                                                            builder: (RunMutation?
                                                                    runMutation,
                                                                QueryResult?
                                                                    result) {
                                                              return (Button(
                                                                '${LocalizationHelper.of(context)!.t_confirmButton}',
                                                                () {
                                                                  setIsConfirmedCinBack(
                                                                      true);
                                                                  runMutation!(<
                                                                      String,
                                                                      dynamic>{
                                                                    "image":
                                                                        cinbackName,
                                                                  });
                                                                },
                                                              ));
                                                            })
                                                        : const Icon(
                                                            Icons
                                                                .check_circle_outline,
                                                            color: Color(
                                                                0xFF65C88D),
                                                            size: 40,
                                                          )),
                                                const Spacing(40),
                                                _cinBack != null
                                                    ? Text(cinbackName)
                                                    : Text(
                                                        '${LocalizationHelper.of(context)!.t_no_image_selected}'),
                                              ],
                                            )),
                                        const Spacing(40),
                                        DateField(
                                          initialvalue: box.get("BirthdayDate"),
                                          valueName: 'BirthdayDate',
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
                                  )
                            ]),
                      )
                    ]))));
  }
}


 /*  cinList.isEmpty
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
                                          ]),*/

                                          //String fileName = "";

  /*final ImagePicker cinsImage = ImagePicker();
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
*/