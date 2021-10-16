import 'package:flutter/material.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({ Key? key }) : super(key: key);

  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Center(
        child: Text("data"),
      )
    );
  }
}