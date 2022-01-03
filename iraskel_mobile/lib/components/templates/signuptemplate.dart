import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_custominput.dart';
import 'package:iraskel_mobile/components/atoms/_dropdowninputdecorator.dart';
import 'package:iraskel_mobile/components/atoms/_graphqloutlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_phonefield.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/molecules/_querydropdown.dart';


String createUser = """
mutation (\$input: UserInput!) {
  create_user(input: \$input) {
    created
    user {
      email
      username
			is_confirmed
			is_verified
			
    }
    err {
      code
      message
    }
  }
}
""";

class SignUpTemplate extends StatefulWidget {
  final String imageSrc;
  // ignore: prefer_typing_uninitialized_variables
  final fitType;
  final String title;
  final String hinttext1;
  final String hinttext2;
  // ignore: prefer_typing_uninitialized_variables
  final grahqlCode1;
  // ignore: prefer_typing_uninitialized_variables
  final grahqlCode2;
  final String dropdowntextinput1;
  final String dropdowntextinput2;
  // ignore: prefer_typing_uninitialized_variables
  final listItems1;
  // ignore: prefer_typing_uninitialized_variables
  final listItems2;

  final String text;
  final String txt;
  final String id;
  final bool isquery;
  final grahqlCode;
    final Map<String, dynamic> variables;


  // ignore: prefer_typing_uninitialized_variables
  final int;

  // ignore: use_key_in_widget_constructors
  const SignUpTemplate(
    this.imageSrc,
    this.fitType,
    this.title,
    this.int,
    this.hinttext1,
    this.hinttext2,
    this.grahqlCode1,
    this.grahqlCode2,
    this.dropdowntextinput1,
    this.dropdowntextinput2,
    this.listItems1,
    this.listItems2,
    this.text,
    this.id,

    this.txt,
    this.isquery,
    this.grahqlCode,
    this.variables
  );

  @override
  _SignUpTemplateState createState() => _SignUpTemplateState();
}

class _SignUpTemplateState extends State<SignUpTemplate> {
  @override
  void initState() {
    super.initState();
  }

  late String stateId = "";
  late String municipalityId = "";
  late String lastName = "";
  late String firstName = "";
  late int phoneNumber  ;

  setStateId(value) {
    setState(() => {stateId = value});
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

  onpressed() {
    
    }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 25,
            bottom: MediaQuery.of(context).size.height / 80),
        elevation: 0,
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: CustomDecoration(widget.imageSrc, widget.fitType)
              .baseBackgroundDecoration(),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.center, // <-- alignments
              children: [
                Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 20),
                  child: BigTitle(widget.title),
                ),
                PhoneField(setPhoneNumber),
                Spacing(widget.int),
                CustomInput(widget.hinttext1, setLastName),
                Spacing(widget.int),
                CustomInput(widget.hinttext2, setFirstName),
                Spacing(widget.int),

                 QueryDropDownGraphQl(widget.grahqlCode1,const {"countryId": "1"},  widget.dropdowntextinput1,
                widget.listItems1, widget.text,widget.id,setStateId),
               /* Query(
                    options: QueryOptions(
                        document: gql(widget.grahqlCode1),
                        variables: {"countryId": "1"}),
                    builder: (QueryResult result, {fetchMore, refetch}) {
                      if (result.hasException) {
                        return Text(result.exception.toString());
                      }
                      if (result.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final listItems1 = result.data?[widget.listItems1];
                      return (DropdownInput(widget.dropdowntextinput1,
                          listItems1, widget.text, widget.id, setStateId));
                    }),*/
                Spacing(widget.int),
                QueryDropDownGraphQl(widget.grahqlCode2,{"stateId": stateId},
                    widget.dropdowntextinput2, widget.listItems2, widget.text,widget.id,setMunicipalityId),
               /* Query(
                    options: QueryOptions(
                        document: gql(widget.grahqlCode2),
                        variables: {"stateId": stateId}),
                    builder: (QueryResult result, {fetchMore, refetch}) {
                      if (result.hasException) {
                        return Text(result.exception.toString());
                      }
                      if (result.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final listItems2 = result.data?[widget.listItems2];
                      return (DropdownInput(
                          widget.dropdowntextinput2,
                          listItems2,
                          widget.text,
                          widget.id,
                          setMunicipalityId));
                    }),*/
                Spacing(widget.int),
                GraphqlButton(widget.txt, widget.isquery, widget.grahqlCode, widget.variables)
                
                      
                    
              ],
            ),
          ),
        ));
  }
}
