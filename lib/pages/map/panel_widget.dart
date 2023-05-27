import 'package:flutter/material.dart';
import 'package:shareover/pages/map/router.dart';
import 'package:shareover/pages/map/shop_view.dart';
import 'package:shareover_api/api.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  final OfferLocation location;
  final Function(PopupType, Object?)? openPopup;

  const PanelWidget({
    Key? key,
    required this.controller,
    required this.panelController,
    required this.location,
    required this.openPopup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: controller,
        children: <Widget>[
          const SizedBox(height: 12),
          buildDragHandle(),
          const SizedBox(height: 70),
          buildText(),
          const SizedBox(height: 25),
        ],
      );

  Widget buildDragHandle() => GestureDetector(
        onTap: togglePanel,
        child: Center(
          child: Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  Widget buildText() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ShopView(
              location: location,
              openPopup: openPopup,
            ),
          ],
        ),
      );
}
