import 'package:flutter/material.dart';

import 'package:im_stepper/stepper.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/pages/calendarpage.dart';
import 'package:iraskel_mobile/components/pages/notificationpage.dart';
import 'package:iraskel_mobile/components/templates/adresseform.dart';
import 'package:iraskel_mobile/components/templates/compteform.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic> user;
 // final bool visible;
  
  const HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activestep = 0;
  int dotcount = 4;
  final screens = [
    CompteForm(),
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

  /* List<FAStep> _stepper =[
    FAStep(content:CompteForm() )
  ];*/
  @override
  Widget build(BuildContext context) {
    return widget.user['is_confirmed'] && !widget.user['is_verified']
        ?  Card(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Spacing(20),
                  /* Container(
            //  height:  MediaQuery.of(context).size.height / 2,
                child: Stepper(
            type: StepperType.horizontal,
            steps: _stepper(),
            physics: const ClampingScrollPhysics(),
          ))*/
          Expanded(
                    child: IndexedStack(
                      index: activestep,
                      children: screens,
                    ),
                  ),
                  // Padding(padding: const EdgeInsets.all(18.0), child: steps( )),
                 
                  Container(
                    /* decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Color(0xFF65C88D)),*/
                    child: DotStepper(
                      direction: Axis.horizontal,
                      activeStep: activestep,
                      dotCount: dotcount,
                      dotRadius: 20,
                      shape: Shape.ring,
                      tappingEnabled:false,
                      lineConnectorsEnabled:true,
                      spacing: 80,
                      //fillStep: true,
                      indicator: Indicator.jump,
                      fixedDotDecoration:
                          FixedDotDecoration(color: Color(0xFFDFF4EC)),
                      indicatorDecoration:
                          IndicatorDecoration(color: Color(0xFF65C88D)),
                          lineConnectorDecoration: LineConnectorDecoration(
                           strokeWidth: 20,
                            color:Color(0xFFDFF4EC) ),
                   /*  onDotTapped: (tap) {
                        setState(() {
                          activestep = activestep;
                        });
                      },*/
                      
                    ),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [previousButton(), nextButton()],
                  ),
                  
                ]),
              
          )
        : Container(
            child: Text("error"),
          );
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

  /* List<Step> _stepper() {
    List<Step> _steps = [
      Step(title: Text('Compte'), content: CompteForm()),
      /*Step(
          title: Text('cc'),
          content:
              TextFormField(decoration: InputDecoration(labelText: "text"))),*/
    ];
    return _steps;
  }*/
}
