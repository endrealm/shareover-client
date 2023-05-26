import 'package:flutter/material.dart';

import 'router.dart';

class MapOverlayWidget extends StatelessWidget {
  final Function(PopupType)? openPopup;

  const MapOverlayWidget({Key? key, this.openPopup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Column(
      children: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  openPopup?.call(PopupType.createOffer);
                },
                child: const Text("create")),
            ElevatedButton(
                onPressed: () {
                  openPopup?.call(PopupType.subscription);
                },
                child: const Text("subscription")),
            ElevatedButton(
                onPressed: () {
                  openPopup?.call(PopupType.notification);
                },
                child: const Text("notification")),
          ],
        )
      ],
    ));
  }
}
