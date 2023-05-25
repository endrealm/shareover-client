import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  double INNER_RING = .7;

  late GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      tiltGesturesEnabled: false,
      compassEnabled: false,
      rotateGesturesEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: const CameraPosition(target: LatLng(51.1657, 10.4515), zoom: 6, tilt: 45),
      onMapCreated: (c) async {
        controller = c;
        controller.setMapStyle(await getJsonFile("assets/map_style.json"));
      },
    );
  }

  Future<String> getJsonFile(String path) async {
    ByteData bytes = await rootBundle.load(path);
    var list = bytes.buffer.asUint8List(bytes.offsetInBytes,bytes.lengthInBytes);
    return utf8.decode(list);
  }
}
