import 'package:flutter/material.dart';
import 'package:shareover/components/offer.dart';
import 'package:shareover/pages/map/popups/accept_offer.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    APIService.of(context).offerApi.offerListIdGet(int.parse(widget.location.id!)).then((value) {
      setState(() {
        offers = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var parts = <Widget>[];
    int index = -1;
    for (var offer in offers) {
      index++;
      if(index != 0) {
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