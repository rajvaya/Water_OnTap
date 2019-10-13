import 'dart:async';
import 'package:permission/permission.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      drawer: Drawer(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                    accountName: Text("NOOB"),
                    accountEmail: Text("NOOB@noob.com"))
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.blueAccent,
                child: ListTile(
                  title: Text("Become a Water Refiller",style: TextStyle(
                    fontSize: 18
                  ),),
                ),
              ),

            )
          ],
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        markers: {Marker1},
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Marker Marker1 = Marker(
    markerId: MarkerId('gramercy'),
    position: LatLng(19.104498, 72.836024),
    infoWindow: InfoWindow(title: 'RAJ VAYA', snippet: "hellow"),
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
