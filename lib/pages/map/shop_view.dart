import 'package:flutter/material.dart';
import 'package:shareover/components/offer.dart';
import 'package:shareover_api/api.dart';

import '../../services/api_service.dart';

class ShopView extends StatefulWidget {
  final OfferLocation location;

  const ShopView({Key? key, required this.location}) : super(key: key);

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
        print("offers");
        offers = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: offers.map((e) => OfferWidget(
        offer: e,
        canBeDeleted: false,
      )).toList(),
    );
  }
}