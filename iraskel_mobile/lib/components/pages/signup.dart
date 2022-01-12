import 'package:flutter/material.dart';
//import 'package:iraskel_mobile/components/templates/signuptemplate.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iraskel_mobile/components/atoms/_bigtitle.dart';
import 'package:iraskel_mobile/components/atoms/_customdecoration.dart';
import 'package:iraskel_mobile/components/atoms/_custominput.dart';
import 'package:iraskel_mobile/components/atoms/_dropdowninputdecorator.dart';
import 'package:iraskel_mobile/components/atoms/_graphqloutlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_phonefield.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/confirmpage.dart';
import 'package:iraskel_mobile/components/pages/signin.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

const createUser = """
mutation (\$input: UserInput!) {
  create_user(input: \$input) {
    created
    user {
      email
      username
      is_confirmed
			is_verified
      phone_number
      			first_name
			last_name
			is_active

			
			
    }
    err {
      code
      message
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


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
  }

  late String stateId = "";
  late String municipalityId = "";
  late String lastName = "";
  late String firstName = "";
  late String phoneNumber = "";

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
 onpressedSignin(){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SignIn()));
      
    }
  oncompleted(data) async {
    
   
    final SharedPreferences prefs = await _prefs;

    prefs.setString(
        'phone_number', data["create_user"]["user"]["phone_number"]);
    prefs.setString('username', data["create_user"]["user"]["username"]);
    prefs.setString('email', data["create_user"]["user"]["email"]);
    prefs.setString('firstname', data["create_user"]["user"]["first_name"]);
    prefs.setString('lastname', data["create_user"]["user"]["last_name"]);
    prefs.setBool('isActive', data["create_user"]["user"]["is_active"]);
    //prefs.setBool('isConfirmed', data["create_user"]["user"]["is_confirmed"]);
    prefs.setBool('isVerified', data["create_user"]["user"]["is_verified"]);
    prefs.setBool('isAuthenticated', true);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ConfirmPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
      margin: const EdgeInsets.only(top: 25, bottom: 10),
      elevation: 0,
      child: Container(
        //constraints: const BoxConstraints.expand(),
        decoration: CustomDecoration(
          'assets/getstarted/back_login.png',
          BoxFit.contain,
        ).baseBackgroundDecoration(),
        child: Container(
          margin:
              const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 10),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            reverse: true,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              // <-- alignments
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 20),
                  child: BigTitle(
                    '${LocalizationHelper.of(context)!.t_join}',
                  ),
                ),
                PhoneField(setPhoneNumber),
                const Spacing(40),
                CustomInput('${LocalizationHelper.of(context)!.t_lastname}',
                    setLastName),
                const Spacing(40),
                CustomInput('${LocalizationHelper.of(context)!.t_firstname}',
                    setFirstName),
                const Spacing(40),

                /* QueryDropDownGraphQl(widget.grahqlCode1, widget.dropdowntextinput1,
                widget.listItems1, widget.text1),*/
                Query(
                    options: QueryOptions(
                        document: gql(stateBYCountry),
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

                      final listItems1 = result.data?['states_by_country'];
                      return (DropdownInput(
                          '${LocalizationHelper.of(context)!.t_state}',
                          listItems1,
                          'name',
                          'id',
                          setStateId));
                    }),
                const Spacing(40),
                /*QueryDropDownGraphQl(widget.grahqlCode2,
                    widget.dropdowntextinput2, widget.listItems2, widget.text2),*/
                Query(
                    options: QueryOptions(
                        document: gql(municipalities),
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

                      final listItems2 = result.data?['municipality_by_state'];
                      return (DropdownInput(
                          '${LocalizationHelper.of(context)!.t_municipality}',
                          listItems2,
                          'name',
                          'id',
                          setMunicipalityId));
                    }),
                const Spacing(40),
                /* Mutation(
                    options: MutationOptions(document: gql(createUser)),
                    builder: (RunMutation? runMutation, QueryResult? result) {
                      return Button('${LocalizationHelper.of(context)!.t_join}',
                          onpressed);
                    })*/
                GraphqlButton(
                    '${LocalizationHelper.of(context)!.t_rejoin}',
                    false,
                    createUser,
                    {
                      "input": {
                        "phone_number": phoneNumber,
                        "first_name": firstName,
                        "last_name": lastName,
                        "municipality_id": municipalityId
                      }
                    },
                    oncompleted,),
                    Button('Se connecter', onpressedSignin)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
