import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fillme/widgets/loader.dart';
import '../authentication/auth.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Munci extends StatefulWidget {
  Munci({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;
  @override
  _HelpToUser createState() => new _HelpToUser();
}

Position position;

class _HelpToUser extends State<Munci> {
  Map<PolylineId, Polyline> _mapPolylines = {};
  int _polylineIdCounter = 1;
  PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Completer<GoogleMapController> _controller = Completer();
  bool loading = true;
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void getCurrentLocation() async {
    Position res = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    setState(() {
      position = res;
      loading = false;
    });
    _add();
    // _createPolylines(position);
  }

  // _createPolylines(Position start) async {
  //   // Initializing PolylinePoints
  //   polylinePoints = PolylinePoints();

  //   // Generating the list of coordinates to be used for
  //   // drawing the polylines
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     "AIzaSyD5gG_7DtOXby8nGNbHWP_Gt3qo1Hwnra8",
  //     PointLatLng(start.latitude,start.longitude),
  //     PointLatLng(13.512038,74.773564),
  //     travelMode: TravelMode.transit,
  //     wayPoints: [PolylineWayPoint(location:'13.536405,74.789711' )]
  //   );

  //   // Adding the coordinates to the list
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   }

  //   // Defining an ID
  //   final String polylineIdVal = 'polyline_id_$_index';
  //   _index++;
  //   final PolylineId polylineId = PolylineId(polylineIdVal);

  //   // Initializing Polyline
  //   Polyline polyline = Polyline(
  //     polylineId: polylineId,
  //     color: Colors.red,
  //     points: polylineCoordinates,
  //     width: 3,
  //   );

  //   // Adding the polyline to the map
  //   _mapPolylines[polylineId] = polyline;
  // }

  void _add() {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.red,
      width: 5,
      points: _createPoints(),
    );

    setState(() {
      _mapPolylines[polylineId] = polyline;
    });
  }

  List<LatLng> _createPoints() {
    List<LatLng> points = [];
    points.add(LatLng(position.latitude, position.longitude));
    points.add(LatLng(13.536405, 74.789711));
    points.add(LatLng(13.512038, 74.773564));
    return points;
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    void _signOut() async {
      try {
        await widget.auth.signOut();
        widget.onSignOut();
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('munci'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          RaisedButton(
              child: new Text('signout'),
              onPressed: () {
                _signOut();
              }),
        ],
      ),
      body: loading == true
          ? Loader()
          : GoogleMap(
              markers: {
                dustbin1,
                dustbin2,
              },
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 11.0,
              ),
              myLocationEnabled: true,
              polylines: Set<Polyline>.of(_mapPolylines.values),
            ),
    );
  }
}

Marker dustbin1 = Marker(
  markerId: MarkerId('dustbin1'),
  position: LatLng(13.536405, 74.789711),
  infoWindow: InfoWindow(title: 'Shiriyara'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker dustbin2 = Marker(
  markerId: MarkerId('dustbin1'),
  position: LatLng(13.512038, 74.773564),
  infoWindow: InfoWindow(title: 'Sibrakatte'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
