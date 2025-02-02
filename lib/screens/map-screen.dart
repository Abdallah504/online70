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
  late Position _currentPosition;
  final Set<Marker>_markers = {};
 LatLng _initialPosition = const LatLng(123.33, -120.933);

@override
  void initState() {
    _getUserLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: _getUserLocation,
      child: Icon(Icons.pin_drop_outlined),
      ),
      body: GoogleMap(
          mapType: MapType.satellite,
          initialCameraPosition: CameraPosition(target: _initialPosition,zoom: 10),
      markers: _markers,
        onMapCreated: (controller)=> _mapController,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );

}
Future<void>_getUserLocation()async{
Permission.location.request();

if(await Geolocator.isLocationServiceEnabled()){
  Position positionnn = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high
  );

  setState(() {
    _currentPosition = positionnn;
    _initialPosition = LatLng(positionnn.latitude, positionnn.longitude);

    _markers.add(
      Marker(markerId: MarkerId(
        'current-user-location'
      ),
        position: _initialPosition,
        infoWindow: InfoWindow(title: 'User Location')
      )
    );
  });
  _mapController.animateCamera(
    CameraUpdate.newCameraPosition(CameraPosition(target: _initialPosition,
    zoom: 14
    ))
  );
}else{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enable Location Service')));
}

}


}
