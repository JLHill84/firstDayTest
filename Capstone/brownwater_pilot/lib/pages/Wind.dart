import 'dart:async';
import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class Wind extends StatefulWidget {
  @override
  _WindState createState() => _WindState();
}

class WindStation {
  String name;
  String speed;
  double bearing;
  double lat;
  double lng;

  WindStation.fromJson(Map<String, dynamic> data)
      : name = data['name'],
        speed = data['windSpeed']['value'],
        bearing = data['windDirection']['value'],
        lat = data['geometry']['coordinates'][1],
        lng = data['geometry']['coordinates'][1];
}

class _WindState extends State<Wind> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(29.760427, -95.369804);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  static final CameraPosition _position1 = CameraPosition(
      bearing: 0, target: LatLng(29.760427, -95.369804), tilt: 0, zoom: 11);

  List weatherStations;

  Future<Map<String, dynamic>> _getStationList() async {
    var url = 'https://api.weather.gov/points/29.7604,-95.3698';
    var response = await http.get(url, headers: {
      "token": "AhrYtjbSwpZXOuYdaeZRruodMZIOhjCS",
      "Accept": "application/json"
    });
    Map data = json.decode(response.body);

    var response2 = await http.get(data['properties']['observationStations'],
        headers: {
          "token": "AhrYtjbSwpZXOuYdaeZRruodMZIOhjCS",
          "Accept": "application/json"
        });
    Map data2 = json.decode(response2.body);

    for (int i = 0; i < data2['observationStations'].length; i++) {
      var url = data2['observationStations'][i] +
          "/observations/latest?require_qc=false";

      http.Response loopResponse = await http.get(url, headers: {
        "token": "AhrYtjbSwpZXOuYdaeZRruodMZIOhjCS",
        "Accept": "application/json"
      });

      Map data3 = json.decode(loopResponse.body);
      var station = WindStation.fromJson(data3);
      print(station);
    }

    // print(weatherStations);

    return data2;
    // if (response.statusCode == 200) {
    //   // debugPrint(json.decode(response.body));
    //   return json.decode(response.body);
    // }
    // debugPrint('Response status: ${response.statusCode}');
    // debugPrint('Response body: ${response.body[]}');
  }

  _onMapCreated(GoogleMapController controller) {}
  _onCameraMove(CameraPosition position) {}

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blueGrey,
      child: Icon(icon, size: 36),
    );
  }

  @override
  initState() {
    super.initState();
    _getStationList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
        myLocationButtonEnabled: false,
        compassEnabled: true,
        myLocationEnabled: true,
      ),
      button(_getStationList, Icons.location_searching),
    ]));
    // floatingActionButton: FloatingActionButton(onPressed: _getStationList));
  }
}
