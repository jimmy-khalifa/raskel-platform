

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(34.404644,8.166560),
    zoom: 13,
  );
   late GoogleMapController _googleMapController;
   final Set<Marker> _markers ={};
   late BitmapDescriptor mapMaker;

   @override
   void initState(){
     super.initState();
     setCustomMaker();
   }
   void setCustomMaker() async{
     mapMaker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(5, 5)), 'assets/images/truck.png');

   }

   void _onMapCreated(GoogleMapController controller){
     _googleMapController= controller;
      
     setState(() {
       _markers.add(
         Marker (
           markerId:const MarkerId( 'Source'),
           position: const LatLng(34.380811,8.149020),
           icon: mapMaker,
           infoWindow: const InfoWindow(
             title: "Bureau de poste",

           ),
           

         ),
       );
        _markers.add(
         Marker(
           markerId:const MarkerId( 'Destination'),
           // ignore: prefer_const_constructors
           position: LatLng(34.371340,8.140383),
           icon: mapMaker,
           
           infoWindow: const InfoWindow(
             title: "Redayef Sud",

           ),
           

         ),
       );

     });

   } 
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        markers: _markers,

        initialCameraPosition: _initialCameraPosition,
        onMapCreated:_onMapCreated,
      
        
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF65C88D),
        foregroundColor: const Color(0xFF393E41),
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition)
        ),
        child: const Icon(FeatherIcons.maximize),
        
      ),
    );
  }
  }

