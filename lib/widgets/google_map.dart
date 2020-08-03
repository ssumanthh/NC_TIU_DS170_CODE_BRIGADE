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
Marker dustbin3 = Marker(
  markerId: MarkerId('dustbin1'),
  position: LatLng(12.593435, 74.944917),
  infoWindow: InfoWindow(title: 'kumbla bus stand'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker dustbin4 = Marker(
  markerId: MarkerId('dustbin1'),
  position: LatLng(12.589358, 75.002048),
  infoWindow: InfoWindow(title: 'Seethangoli'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker dustbin5 = Marker(
  markerId: MarkerId('dustbin1'),
  position: LatLng(12.591515, 74.977665),
  infoWindow: InfoWindow(title: 'Naikap'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker dustbin6 = Marker(
  markerId: MarkerId('dustbin1'),
  position: LatLng(12.868517, 74.923913),
  infoWindow: InfoWindow(title: 'adyar garden'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker dustbin7 = Marker(
  markerId: MarkerId('dustbin1'),
  position: LatLng(12.869544, 74.864864),
  infoWindow: InfoWindow(title: 'nantoor'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker dustbin8 = Marker(
  markerId: MarkerId('dustbin1'),
  position: LatLng(12.863228, 74.837169),
  infoWindow: InfoWindow(title: 'statebank busstop'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
