import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:iraskel_mobile/components/atoms/_dotstepper.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/confirmationinfo.dart';
import 'package:iraskel_mobile/components/templates/accountform.dart';
import 'package:iraskel_mobile/components/templates/addressform.dart';
import 'package:iraskel_mobile/components/templates/bacform.dart';
import 'package:iraskel_mobile/components/templates/propertiesform.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

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
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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
   const   AccountForm(false,true,false),
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
               title:  Text('${LocalizationHelper.of(context)!.t_confirmation}'),
                content:
                     Text('${LocalizationHelper.of(context)!.t_registration}'),
                actions: [
                  /* GraphqlButton('Confirmer', false, updateProducer, {
                     
                   }, oncompleted)*/
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Annuler'),
                    child:  Text('${LocalizationHelper.of(context)!.t_cancel}',
                        style: const TextStyle(color: Color(0xFF65C88D))),
                  ),
                  TextButton(
                      onPressed: oncompleted,
                      child:  Text('${LocalizationHelper.of(context)!.t_ok}',
                        style: const TextStyle(color: Color(0xFF65C88D)),
                      ))
                ],
                // content: ,
              ));
    } else if (activestep == 1) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
               title:  Text('${LocalizationHelper.of(context)!.t_confirmation}'),
                content:
                     Text('${LocalizationHelper.of(context)!.t_registration}'),
                actions: [
                  /* GraphqlButton('Confirmer', false, updateProducer, {
                     
                   }, oncompleted)*/
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Annuler'),
                    child:  Text('${LocalizationHelper.of(context)!.t_cancel}',
                        style: const TextStyle(color: Color(0xFF65C88D))),
                  ),
                  TextButton(
                      onPressed: oncompleted,
                      child:  Text('${LocalizationHelper.of(context)!.t_ok}',
                          style: const TextStyle(color: Color(0xFF65C88D))))
                ],
                // content: ,
              ));
    } else if (activestep == 2) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
               title:  Text('${LocalizationHelper.of(context)!.t_confirmation}'),
                content:
                     Text('${LocalizationHelper.of(context)!.t_registration}'),
                actions: [
                  /* GraphqlButton('Confirmer', false, updateProducer, {
                     
                   }, oncompleted)*/
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Annuler'),
                    child:  Text('${LocalizationHelper.of(context)!.t_cancel}',
                        style: const TextStyle(color: Color(0xFF65C88D))),
                  ),
                  TextButton(
                      onPressed: oncompleted,
                      child:  Text('${LocalizationHelper.of(context)!.t_ok}',
                          style: const TextStyle(color: Color(0xFF65C88D))))
                ],
                // content: ,
              ));
    } else if (activestep == 3) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title:  Text('${LocalizationHelper.of(context)!.t_confirmation}'),
                content:
                     Text('${LocalizationHelper.of(context)!.t_registration}'),
                actions: [
                  /* GraphqlButton('Confirmer', false, updateProducer, {
                     
                   }, oncompleted)*/
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Annuler'),
                    child:  Text('${LocalizationHelper.of(context)!.t_cancel}',
                        style: const TextStyle(color: Color(0xFF65C88D))),
                  ),
                  TextButton(
                      onPressed: oncompleted,
                      child:  Text('${LocalizationHelper.of(context)!.t_ok}',
                          style: const TextStyle(color: Color(0xFF65C88D))))
                ],
                // content: ,
              ));
    } else if (activestep + 1 == dotcount) {
      return showDialog(
          context: context,
          builder: (BuildContext context) =>  AlertDialog(
                title: Text('${LocalizationHelper.of(context)!.t_congrats}'),
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

  late bool isConfirmed = false;
  late bool isVerified = false;

  void initHiveState() async {
    late final Box box = Hive.box('auth');
    isConfirmed = box.get('isConfirmed');
    isVerified = box.get('isVerified');
  }

  @override
  void initState() {
    super.initState();
    initHiveState();
  }

  /* List<FAStep> _stepper =[
    FAStep(content:CompteForm() )
  ];*/
  @override
  Widget build(BuildContext context) {


    return (isConfirmed && !isVerified)
        ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Spacing(20),
            Expanded(
              child: IndexedStack(
                index: activestep,
                children: screens,
              ),
            ),
            // Padding(padding: const EdgeInsets.all(18.0), child: steps( )),

            StepDot(activestep, dotcount),
            Directionality(textDirection: TextDirection.ltr, child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                 
                previousButton(), 
                nextButton()],
            )),
          ])
        : const Text("error");
  }

  

  /// Returns the next button widget.
  Widget nextButton() {
    return
   
      IconButton(
        onPressed: onpressed,
        icon: const Icon(
          FeatherIcons.chevronsRight,
          color: Color(0xFF74c69d),
        ));
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return
   
     
    IconButton(
        onPressed: onBack,
        icon: const Icon(
          
          FeatherIcons.chevronsLeft,
          
          color: Color(0xFF74c69d),
        ));
  }
}
