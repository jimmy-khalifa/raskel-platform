import 'package:flutter/material.dart';
import 'DrawerView.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        endDrawer: DrawerView(),
        body:GoogleMap(
          initialCameraPosition: CameraPosition
          (target: LatLng(8.13	,33.93),
          zoom: 15,

        )) 

        );
  }
}
