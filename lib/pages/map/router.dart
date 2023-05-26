import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shareover/pages/map/popups/create_offer.dart';
import 'package:shareover/pages/map/popups/notification.dart';
import 'package:shareover/pages/map/popups/subscription/subscription.dart';
import 'package:shareover/pages/map/sliding_map.dart';

enum PopupType { closed, createOffer, subscription, notification }

class RouterWidget extends StatefulWidget {
  const RouterWidget({Key? key}) : super(key: key);

  @override
  State<RouterWidget> createState() => _RouterWidgetState();
}

class _RouterWidgetState extends State<RouterWidget> {

  var _popupType = PopupType.closed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlidingMapWidget(
          openPopup: (type) {
            setState(() {
              _popupType = type;
            });
          },
        ),
        getFromType(_popupType),
      ],
    );
  }

  closePopup() {
    setState(() {
      _popupType = PopupType.closed;
    });
  }

  Widget getFromType(PopupType popupType) {
    if (popupType == PopupType.createOffer) {
      return CreateOfferWidget(
        close: closePopup,
      );
    }
    if (popupType == PopupType.notification) {
      return NotificationWidget(
        close: closePopup,
      );
    }
    if (popupType == PopupType.subscription) {
      return SubscriptionWidget(
        close: closePopup,
      );
    }
    return const SizedBox.shrink();
  }
}

