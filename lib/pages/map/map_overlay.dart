import 'package:flutter/material.dart';

import 'router.dart';

class MapOverlayWidget extends StatelessWidget {
  final Function(PopupType, Object?)? openPopup;

  const MapOverlayWidget({Key? key, this.openPopup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Container(
            height: 30,
          ),
          Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ))),
                onPressed: () {
                  openPopup?.call(PopupType.createOffer, null);
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ))),
                onPressed: () {
                  openPopup?.call(PopupType.notification, null);
                },
                child: const Icon(Icons.notifications),
              ),
            ],
          )
        ],
      ),
    );
  }
}
