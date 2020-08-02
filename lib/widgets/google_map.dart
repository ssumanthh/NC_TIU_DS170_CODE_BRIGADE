import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'loader.dart';

class GoogleMaps extends StatefulWidget {
  @override
  _BinMap createState() => _BinMap();
}

Position position;

class _BinMap extends State<GoogleMaps> {
  bool loading = true;

  Completer<GoogleMapController> _controller = Completer();

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
  }

//  Set<Marker> _currentLocationMarker() {
//     return <Marker>[
//       Marker(
//         markerId: MarkerId("Current Location"),
//         position: LatLng(position.latitude, position.longitude),
//         icon: BitmapDescriptor.defaultMarker,
//         infoWindow: InfoWindow(
//           title: "Current Location",
//         ),
//       ),
//     ].toSet();
//   }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Bins'),
      ),
      body: loading == true
          ? Loader()
          : GoogleMap(
              markers: {
                dustbin1,
                dustbin2,
                dustbin3,
                dustbin4,
                dustbin5,
                dustbin6,
                dustbin7,
                dustbin8
              },
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 11.0,
              ),
              myLocationEnabled: true,
            ),
    );
  }
}
