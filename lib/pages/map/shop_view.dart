import 'package:flutter/material.dart';
import 'package:shareover/components/offer.dart';
import 'package:shareover/pages/map/router.dart';
import 'package:shareover_api/api.dart';

import '../../services/api_service.dart';

class ShopView extends StatefulWidget {
  final OfferLocation location;
  final Function(PopupType, Object?)? openPopup;

  const ShopView({Key? key, required this.location, required this.openPopup}) : super(key: key);

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {

  List<Offer> offers = [];
  UserProfile? profile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    APIService.of(context)
        .offerApi
        .offerListIdGet(int.parse(widget.location.id!))
        .then((value) {
      setState(() {
        offers = value!;
      });
    });

    APIService.of(context)
        .userApi
        .userIdGet(int.parse(widget.location.id!))
        .then((value) {
      setState(() {
        profile = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var parts = <Widget>[];
    parts.add(Text(profile?.username ?? "loading"));
    parts.add(Text(profile?.location ?? "loading"));

    int index = -1;
    for (var offer in offers) {
      index++;
      if (index != 0) {
        parts.add(const Divider());
      }

      parts.add(OfferWidget(
        offer: offer,
        canBeDeleted: false,
        onClick: () => widget.openPopup?.call(PopupType.acceptOffer, offer),
      ));
    }

    return Column(
      children: parts,
    );
  }
}