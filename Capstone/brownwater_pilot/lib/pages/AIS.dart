import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AISPage extends StatefulWidget {
  @override
  _AISPageState createState() => _AISPageState();
}

class _AISPageState extends State<AISPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(29.760427, -95.369804);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  static final CameraPosition _position1 = CameraPosition(
      bearing: 192, target: LatLng(29.760427, -95.369804), tilt: 60, zoom: 11);

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypesButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'This is a Title',
          snippet: 'This is a Snippet',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(icon, size: 36),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: <Widget>[
                      button(_onAddMarkerButtonPressed, Icons.add_location),
                      SizedBox(
                        height: 16,
                      ),
                      // button(_onMapTypesButtonPressed, Icons.map)
                    ],
                  ))),
        ]),
      ),
    );
  }
}
