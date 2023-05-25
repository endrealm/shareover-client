import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapWidget extends StatefulWidget {

  final Function(Point?) onPlaceChange;

  const MapWidget(this.onPlaceChange, {Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  double INNER_RING = .7;

  late GoogleMapController controller;
  late LocationData lastPos;

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
        final location = await Location().getLocation();
        controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(location.latitude!, location.longitude!), 15));

      },
      onTap: (_) => widget.onPlaceChange(null),
    );
  }

  Future<String> getJsonFile(String path) async {
    ByteData bytes = await rootBundle.load(path);
    var list = bytes.buffer.asUint8List(bytes.offsetInBytes,bytes.lengthInBytes);
    return utf8.decode(list);
  }
}
