import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shareover/services/api_service.dart';
import 'package:shareover_api/api.dart';

class MapWidget extends StatefulWidget {
  final Function(OfferLocation?) onPlaceChange;

  const MapWidget({Key? key, required this.onPlaceChange}) : super(key: key);

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  double INNER_RING = .7;

  late GoogleMapController controller;
  Set<Marker> markers = {};
  LocationData? lastPos;

  @override
  Widget build(BuildContext context) {
    var apiService = APIService.of(context);
    return GoogleMap(
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      tiltGesturesEnabled: false,
      compassEnabled: false,
      rotateGesturesEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: const CameraPosition(
          target: LatLng(51.1657, 10.4515), zoom: 6, tilt: 45),
      onMapCreated: (c) async {
        controller = c;
        controller.setMapStyle(await getJsonFile("assets/map_style.json"));
        final location = await Location().getLocation();
        controller.animateCamera(CameraUpdate.newLatLngZoom(
            LatLng(location.latitude!, location.longitude!), 15));
        final res = await apiService.offerApi
            .offerListNearbyGet(location.latitude!, location.longitude!);
        setMarkers(res!);

        Location().onLocationChanged.listen(onLocationChange);
      },
      markers: markers,
      onTap: (_) => widget.onPlaceChange(null),
    );
  }

  onLocationChange(LocationData event) async {
    if (lastPos != null &&
        _calculateDistance(event.latitude!, event.longitude!,
                lastPos!.latitude!, lastPos!.longitude!) <=
            INNER_RING) return;

    lastPos = event;
    final res = await APIService.of(context)
        .offerApi
        .offerListNearbyGet(event.latitude!, event.longitude!);
    setMarkers(res!);
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<Marker> pointToMarker(OfferLocation offerLocation) async {
    return Marker(
        markerId: MarkerId(offerLocation.id!),
        position: LatLng(
            offerLocation.lat!.toDouble(), offerLocation.lon!.toDouble()),
        onTap: () => widget.onPlaceChange(offerLocation));
  }

  setMarkers(List<OfferLocation> points) async {
    final newMarkers = await Future.wait(points.map((e) => pointToMarker(e)));
    setState(
      () {
        markers = newMarkers.toSet();
      },
    );
  }

  Future<String> getJsonFile(String path) async {
    ByteData bytes = await rootBundle.load(path);
    var list =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    return utf8.decode(list);
  }
}
