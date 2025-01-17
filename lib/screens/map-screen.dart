import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController _mapController;

  LatLng _initialPosition = const LatLng(37.7749, -122.4194);
 late LatLng userPostion;

  late Position _currentPosition;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    _getuserlocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _getuserlocation,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
     body: GoogleMap(
         mapType: MapType.normal,
         initialCameraPosition: CameraPosition(target: _initialPosition,zoom: 10

         ),
       markers: _markers,
       onMapCreated: (controller)=>_mapController = controller,


       myLocationEnabled: true,
       myLocationButtonEnabled: true

     ),
    );
  }
Future<void> _getuserlocation()async{
    Permission.location.request();

    if(await Geolocator.isLocationServiceEnabled()){
      Position positionnnn = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );
      setState(() {
        _currentPosition = positionnnn;
        _initialPosition = LatLng(positionnnn.latitude, positionnnn.longitude);
        //userPostion = LatLng(positionnnn.latitude, positionnnn.longitude);
        _markers.add(
          Marker(markerId: MarkerId('current_location'),
          position: _initialPosition,
            infoWindow: InfoWindow(title: 'user Location')
          )

        );
      });
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          target: _initialPosition,
          zoom: 14
        ))
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enable location service')));
    }

}
}
