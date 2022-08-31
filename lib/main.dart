import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

// Set<Marker> _markers = {};
// void _onMapCreated(GoogleMapController controller) {
//   setState(() {
//     _markers.add(Marker(
//         markerId: MarkerId('id-1'),
//     position: LatLng(37.42796133580664, -122.085749655962),
//     ));
//   }
//   );
// }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  /////////
 /// List<Marker> _marker = [];
  /// List<Marker> _list = const[
  /// Marker(
  /// markerId: MarkerId('1')
  /// position: LatLng(43.8756347865, -23.45353454354),
  /// infoWindow: InfoWindow(
  /// title: "My current location"
  /// )
  /// )
  ///
  /// Marker(
  //   /// markerId: MarkerId('1')
  //   /// position: LatLng(43.8756347865, -23.45353454354),
  //   /// infoWindow: InfoWindow(
  //   /// title: "My current location"
  //   /// )
  //   /// )
  ///
  /// ]
  ///
  ///
  /// @override
  /// void initState() {
  /// super.initState();
  /// _marker.addAll(_list);
  /////////////


  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        /// markers: Set<Marker>.of(_marker) ,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

//google developer console
// console.developers.google.com
//select project= new project
//name= create.
//===================
//navigation drawer >> api nd services >> enabled api nd services >>
// android, ios >> enable
// ============
//nav drawwer >> credentials >> create cred >> api key >>
//api key1 >> click
//below>> restrict key >> select api >> map sdk android >> ios >>
// save >> show key >> copy
//pub dev >> google map flutter >> add yaml file.
// our project
//=====================
//code
// android >> app >> buildgradle >> minsdkversion 20(line 39)
// ================
//android >> app >> src >> main >> manifest >> metadata -copty>paste >> key paste
//==================
//android >> build gradle >> dependencies-inside
//3rd line --  classpath com.google.gms: google-services: 4.3.13