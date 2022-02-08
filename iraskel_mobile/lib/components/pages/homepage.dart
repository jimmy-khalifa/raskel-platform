import 'package:flutter/material.dart';

import 'package:iraskel_mobile/components/atoms/_dotstepper.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/confirmationinfo.dart';
import 'package:iraskel_mobile/components/templates/accountform.dart';
import 'package:iraskel_mobile/components/templates/addressform.dart';
import 'package:iraskel_mobile/components/templates/bacform.dart';
import 'package:iraskel_mobile/components/templates/propertiesform.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class HomePage extends StatefulWidget {
//  final Map<String, dynamic> user;
  // final bool visible;

  // ignore: use_key_in_widget_constructors
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  oncompleted() {
    // final SharedPreferences prefs = await _prefs;
    // prefs.setString('id', data["producer_by_user"]["id"]);

    setState(() {
      activestep++;
    });
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  int activestep = 0;
  int dotcount = 5;
  final screens = [
    const AccountForm(),
    const AddressForm(),
    const PropertiesForm(),
    const BacForm(),
    const ConfirmationInfo()
  ];
  onpressed() {
    /* if (activestep < dotcount - 1) {
      setState(() {
        activestep++;
      });*/
    if (activestep == 0) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Confirmation !'),
                content:
                    const Text('Voulez vous enregistrer ces informations ?'),
                actions: [
                  /* GraphqlButton('Confirmer', false, updateProducer, {
                     
                   }, oncompleted)*/
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Annuler'),
                    child: const Text('Annuler',
                        style: TextStyle(color: Color(0xFF65C88D))),
                  ),
                  TextButton(
                      onPressed: oncompleted,
                      child: const Text(
                        'Ok',
                        style: TextStyle(color: Color(0xFF65C88D)),
                      ))
                ],
                // content: ,
              ));
    } else if (activestep == 1) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Confirmation !'),
                content:
                    const Text('Voulez vous enregistrer ces informations ?'),
                actions: [
                  /* GraphqlButton('Confirmer', false, updateProducer, {
                     
                   }, oncompleted)*/
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Annuler'),
                    child: const Text('Annuler',
                        style: TextStyle(color: Color(0xFF65C88D))),
                  ),
                  TextButton(
                      onPressed: oncompleted,
                      child: const Text('Ok',
                          style: TextStyle(color: Color(0xFF65C88D))))
                ],
                // content: ,
              ));
    } else if (activestep == 2) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Confirmation !'),
                content:
                    const Text('Voulez vous enregistrer ces informations ?'),
                actions: [
                  /* GraphqlBu
                  tton('Confirmer', false, updateProducer, {
                     
                   }, oncompleted)*/
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Annuler'),
                    child: const Text('Annuler',
                        style: TextStyle(color: Color(0xFF65C88D))),
                  ),
                  TextButton(
                      onPressed: oncompleted,
                      child: const Text('Ok',
                          style: TextStyle(color: Color(0xFF65C88D))))
                ],
                // content: ,
              ));
    } else if (activestep == 3) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Confirmation !'),
                content:
                    const Text('Voulez vous enregistrer ces informations ?'),
                actions: [
                  /* GraphqlButton('Confirmer', false, updateProducer, {
                     
                   }, oncompleted)*/
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Annuler'),
                    child: const Text('Annuler',
                        style: TextStyle(color: Color(0xFF65C88D))),
                  ),
                  TextButton(
                      onPressed: oncompleted,
                      child: const Text('Ok',
                          style: TextStyle(color: Color(0xFF65C88D))))
                ],
                // content: ,
              ));
    } else if (activestep + 1 == dotcount) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
                title: Text('Félicitation'),
                // content: ,
              ));
    }
  }

  onBack() {
    if (activestep > 0) {
      setState(() {
        activestep--;
      });
    }
  }

  late Future<bool?> isConfirmed;
  late Future<bool?> isVerified;

  @override
  void initState() {
    super.initState();
    isConfirmed = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('isConfirmed');
    });
    isVerified = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('isVerified');
    });
  }

  /* List<FAStep> _stepper =[
    FAStep(content:CompteForm() )
  ];*/
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
        future: isConfirmed,
        //initialData: false,
        builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
          return FutureBuilder<bool?>(
              future: isVerified,
              // initialData: false,
              builder: (BuildContext context1, AsyncSnapshot<bool?> snapshot1) {
                return ((snapshot.hasData) && (snapshot.data as bool)) &&
                        ((snapshot1.hasData) && !(snapshot1.data as bool))
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            const Spacing(20),
                            Expanded(
                              child: IndexedStack(
                                index: activestep,
                                children: screens,
                              ),
                            ),
                            // Padding(padding: const EdgeInsets.all(18.0), child: steps( )),

                            StepDot(activestep, dotcount),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [previousButton(), nextButton()],
                            ),
                          ])
                    : const Text("error");
              });
        });
  }

  Row steps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dotcount, (index) {
        return ElevatedButton(
          child: Text('${index + 1}'),
          onPressed: () {
            setState(() {
              activestep = index;
            });
          },
        );
      }),
    );
  }

  /// Returns the next button widget.
  Widget nextButton() {
    return Button(
      'Suite',
      onpressed,
      MediaQuery.of(context).size.width / 20,
      MediaQuery.of(context).size.height / 80,
    );
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return Button(
      'Retour',
      onBack,
      MediaQuery.of(context).size.width / 20,
      MediaQuery.of(context).size.height / 80,
    );
  }
}
