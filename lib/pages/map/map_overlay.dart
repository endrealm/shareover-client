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
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
              ),
              onPressed: () {
                openPopup?.call(PopupType.createOffer);
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                openPopup?.call(PopupType.notification);
              },
              child: const Icon(Icons.notifications),
            ),
          ],
        )
      ],
    ));
  }
}
