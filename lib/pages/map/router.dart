import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shareover/pages/map/popups/accept_offer.dart';
import 'package:shareover/pages/map/popups/create_offer.dart';
import 'package:shareover/pages/map/popups/notification.dart';
import 'package:shareover/pages/map/popups/subscription/subscription.dart';
import 'package:shareover/pages/map/sliding_map.dart';
import 'package:shareover_api/api.dart';

enum PopupType { closed, createOffer, subscription, notification, acceptOffer }

class RouterWidget extends StatefulWidget {
  const RouterWidget({Key? key}) : super(key: key);

  @override
  State<RouterWidget> createState() => _RouterWidgetState();
}

class _RouterWidgetState extends State<RouterWidget> {
  var _popupType = PopupType.closed;
  Object? _popupData;
  var toggleShop = false;

  openPopup(PopupType type, Object? popupData) {
    setState(() {
      _popupType = type;
      _popupData = popupData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlidingMapWidget(
          openPopup: openPopup,
          toggleShop: toggleShop,
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
        openPopup: openPopup,
      );
    }
    if (popupType == PopupType.subscription) {
      return SubscriptionWidget(
        openPopup: openPopup,
      );
    }
    if (popupType == PopupType.acceptOffer) {
      return AcceptOffer(
        reloadShop: () => setState(() {
          toggleShop = !toggleShop;
        }),
        openPopup: openPopup,
        offer: _popupData as Offer,
      );
    }
    return const SizedBox.shrink();
  }
}
