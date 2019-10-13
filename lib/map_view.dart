import 'dart:async';
import 'package:location/location.dart';
import 'package:permission/permission.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}


class _MapViewState extends State<MapView> {
  var clan,clang;

  Completer<GoogleMapController> _controller = Completer();
  var location = new Location();
  var currentLocation = <String, double>{};
  Future<Map<String, double>> _getLocation() async {
    try {
      currentLocation = await location.getLocation();
      clan = currentLocation["latitude"];
      clang = currentLocation["longitude"];
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final CameraPosition _myLocation = CameraPosition(
    target: LatLng(0, 0),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
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

    _getLocation();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(clan, clang))));
  }

  getPermission() async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    var permissionNames =
        await Permission.requestPermissions([PermissionName.Location]);
    Permission.openSettings;
  }
}
