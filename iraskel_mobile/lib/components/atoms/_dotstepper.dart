import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';


class StepDot extends StatelessWidget {
  final int dotcount;
  final int activestep;
  // ignore: use_key_in_widget_constructors
  const StepDot(this.activestep,this.dotcount);

  @override
  Widget build(BuildContext context) {
    return DotStepper(
      
                  direction: Axis.horizontal,
                  activeStep: activestep,
                  dotCount: dotcount,
                  dotRadius: 12,
                  shape: Shape.ring,
                  tappingEnabled: false,
                  lineConnectorsEnabled: false,
                  spacing: 20,
                  //fillStep: true,
                  indicator: Indicator.jump,
                  fixedDotDecoration:
                      const FixedDotDecoration(color: Color(0xFFC7EBDD)),
                  indicatorDecoration:
                      const IndicatorDecoration(color: Color(0xFF65C88D)),
                 /* lineConnectorDecoration: const LineConnectorDecoration(
                      strokeWidth: 20, color: Color(0xFFDFF4EC)),*/
                  /*  onDotTapped: (tap) {
                        setState(() {
                          activestep = activestep;
                        });
                      },*/

                );
  }
}