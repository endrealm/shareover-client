import 'package:flutter/material.dart';
import 'package:shareover/pages/map/map.dart';
import 'package:shareover_api/api.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'map_overlay.dart';
import 'panel_widget.dart';
import 'router.dart';

class SlidingMapWidget extends StatefulWidget {
  final Function(PopupType, Object?)? openPopup;
  final bool toggleShop;

  const SlidingMapWidget(
      {Key? key, required this.openPopup, required this.toggleShop})
      : super(key: key);

  @override
  State<SlidingMapWidget> createState() => _SlidingMapWidgetState();
}

class _SlidingMapWidgetState extends State<SlidingMapWidget> {
  final panelController = PanelController();
  OfferLocation? location;

  var toggleShop = false;
  var roundBorder = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (toggleShop == widget.toggleShop) return;
    toggleShop = widget.toggleShop;
    setState(() {
      panelController.close();
      location = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double panelHeightOpen = MediaQuery.of(context).size.height * 1;
    final double panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        maxHeight: panelHeightOpen,
        minHeight: location != null ? panelHeightClosed : 0,
        parallaxEnabled: true,
        parallaxOffset: 0.1,
        body: Stack(
          children: [
            MapWidget(
              onPlaceChange: (loc) {
                setState(() {
                  location = loc;
                });
              },
            ),
            MapOverlayWidget(
              openPopup: widget.openPopup,
            ),
          ],
        ),
        panelBuilder: (controller) => location == null
            ? Container()
            : PanelWidget(
                openPopup: widget.openPopup,
                controller: controller,
                panelController: panelController,
                location: location!,
              ),
        borderRadius: roundBorder
            ? const BorderRadius.vertical(top: Radius.circular(30))
            : BorderRadius.zero,
        onPanelSlide: (position) => setState(() {
          roundBorder = position < 0.87;
        }),
      ),
    );
  }
}
