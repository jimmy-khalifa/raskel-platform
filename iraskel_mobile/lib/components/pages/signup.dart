import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/templates/signuptemplate.dart';

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
   
  @override
  Widget build(BuildContext context) {
  
    return const Scaffold(
        body: SignUpTemplate(
            'assets/getstarted/back_login.png',
            BoxFit.contain,
            'Joindre',
            40,
            'Prénom',
            'Nom',
            stateBYCountry,
            municipalities,
            'Gouvernorat',
            'Municipalité',
            'states_by_country',
            'municipality_by_state',
            'name',
           
            'id',
            
            'Rejoindre',
            
           ));
  }
}
