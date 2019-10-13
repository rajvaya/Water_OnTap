import 'dart:async';
import 'package:permission/permission.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Reg.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.103378, 72.836391),
    zoom: 16,
  );

  @override
  void initState() {
    // TODO: implement initState
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Water on Tap")),
      ),

      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        markers: {
          Marker1,
          Marker2,
          Marker3,
          Marker4,
          Marker5,
          Marker6,
          Marker7,
          Marker8,
          Marker08,
          Marker9,
          Marker10,
          Marker11
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => Reg()));
        },
        label: Text('Become a Partner'),
        icon: Icon(Icons.person_add),
      ),
    );
  }

  Marker Marker1 = Marker(
    markerId: MarkerId('gramercy'),
    position: LatLng(19.104498, 72.836024),
    infoWindow: InfoWindow(title: 'NMIMS ', snippet: "HOT WATER "),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );
  Marker Marker2 = Marker(
    markerId: MarkerId('gramercy2'),
    position: LatLng(19.104498, 72.836024),
    infoWindow: InfoWindow(title: 'Andheri Station', snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );
  Marker Marker3 = Marker(
    markerId: MarkerId('gramercy3'),
    position: LatLng(19.099618, 72.843952),
    infoWindow: InfoWindow(title: 'Vile Parle Station ', snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );

  Marker Marker4 = Marker(
    markerId: MarkerId('gramercy4'),
    position: LatLng(19.082799, 72.841491),
    infoWindow: InfoWindow(title: 'Santacruz Station', snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );
  Marker Marker5 = Marker(
    markerId: MarkerId('gramercy5'),
    position: LatLng(19.103892, 72.835930),
    infoWindow: InfoWindow(title: 'UCO Bank', snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );

  Marker Marker6 = Marker(
    markerId: MarkerId('gramercy6'),
    position: LatLng(19.103110, 72.835924),
    infoWindow: InfoWindow(title: 'Naskhtra', snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );

  Marker Marker7 = Marker(
    markerId: MarkerId('gramercy7'),
    position: LatLng(19.103634, 72.834369),
    infoWindow: InfoWindow(title: 'Sunridge Hospital', snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );

  Marker Marker8 = Marker(
    markerId: MarkerId('gramercy6'),
    position: LatLng(19.104257, 72.832325),
    infoWindow: InfoWindow(title: 'Juhu Joggers Park', snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );

  Marker Marker08 = Marker(
    markerId: MarkerId('gramercy8'),
    position: LatLng(19.100777, 72.827496),
    infoWindow: InfoWindow(title: 'Starbucks Juhu', snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );
  Marker Marker9 = Marker(
    markerId: MarkerId('gramercy9'),
    position: LatLng(19.108171, 72.833516),
    infoWindow: InfoWindow(title: 'Jain Temple', snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );

  Marker Marker10 = Marker(
    markerId: MarkerId('gramercy10'),
    position: LatLng(19.100411, 72.840746),
    infoWindow: InfoWindow(title: 'McDonald\'s', snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );
  Marker Marker11 = Marker(
    markerId: MarkerId('gramercy11'),
    position: LatLng(19.109941, 72.837501),
    infoWindow: InfoWindow(
        title: 'Mukesh Patel School Of Technology Management & Engineering',
        snippet: "cool water"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );

  getPermission() async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    var permissionNames =
        await Permission.requestPermissions([PermissionName.Location]);
    Permission.openSettings;
  }
}
