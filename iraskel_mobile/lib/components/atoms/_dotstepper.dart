import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';


class StepDot extends StatelessWidget {
  final int dotcount;
  final int activestep;
  const StepDot(this.activestep,this.dotcount);

  @override
  Widget build(BuildContext context) {
    return DotStepper(
                  direction: Axis.horizontal,
                  activeStep: activestep,
                  dotCount: dotcount,
                  dotRadius: 20,
                  shape: Shape.ring,
                  tappingEnabled: false,
                  lineConnectorsEnabled: true,
                  spacing: 80,
                  //fillStep: true,
                  indicator: Indicator.jump,
                  fixedDotDecoration:
                      FixedDotDecoration(color: Color(0xFFDFF4EC)),
                  indicatorDecoration:
                      IndicatorDecoration(color: Color(0xFF65C88D)),
                  lineConnectorDecoration: LineConnectorDecoration(
                      strokeWidth: 20, color: Color(0xFFDFF4EC)),
                  /*  onDotTapped: (tap) {
                        setState(() {
                          activestep = activestep;
                        });
                      },*/
                );
  }
}