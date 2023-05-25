import 'package:flutter/material.dart';

class MapOverlayWidget extends StatelessWidget {
  final Function(String)? openPopup;
  const MapOverlayWidget({Key? key, this.openPopup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      openPopup?.call("hallo");
    }, child: const Text("Hallo"));
  }
}
