import 'package:flutter/material.dart';

import 'package:iraskel_mobile/components/atoms/_dotstepper.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/calendarpage.dart';
import 'package:iraskel_mobile/components/pages/notificationpage.dart';
import 'package:iraskel_mobile/components/templates/accountform.dart';
import 'package:iraskel_mobile/components/templates/adresseform.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
//  final Map<String, dynamic> user;
  // final bool visible;

  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int activestep = 0;
  int dotcount = 4;
  final screens = [
    AccountForm(),
    AdresseForm(),
    NotificationPage(),
    CalendarPage()
  ];
  onpressed() {
    if (activestep < dotcount - 1) {
      setState(() {
        activestep++;
      });
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
                 builder: (BuildContext context1, AsyncSnapshot<bool?> snapshot1){
                 return
            
    
    ((snapshot.hasData )&& (snapshot.data as bool) )&& ((snapshot1.hasData )&&  !(snapshot1.data as bool))
        ? Card(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
            ]),
          )
        : Container(
            child: Text("error"),
                  );});   }  );
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
    return Button('save', onpressed);
    /*ElevatedButton(
      child: Text('Next'),
      onPressed: () {
        /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
        if (activestep < dotcount - 1) {
          setState(() {
            activestep++;
          });
        }
      },
    );*/
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return Button('retourner', onBack);
    /*ElevatedButton(
      child: Text('Prev'),
      onPressed: () {
        // activeStep MUST BE GREATER THAN 0 TO PREVENT OVERFLOW.
        if (activestep > 0) {
          setState(() {
            activestep--;
          });
        }
      },
    );*/
  }

 
}
