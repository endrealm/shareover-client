import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingMapWidget extends StatefulWidget {
  const SlidingMapWidget({Key? key}) : super(key: key);

  @override
  State<SlidingMapWidget> createState() => _SlidingMapWidgetState();
}

class _SlidingMapWidgetState extends State<SlidingMapWidget> {
  final panelController = PanelController();

  var roundBorder = true;

  @override
  Widget build(BuildContext context) {
    final double panelHeightOpen = MediaQuery.of(context).size.height * 1;
    final double panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
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

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  const PanelWidget(
      {Key? key, required this.controller, required this.panelController})
      : super(key: key);

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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Maecenas accumsan lacus vel facilisis volutpat. Consequat semper viverra nam libero justo laoreet sit amet cursus. Nibh sed pulvinar proin gravida hendrerit lectus. Ut ornare lectus sit amet est placerat in. Nullam non nisi est sit amet facilisis magna etiam tempor. Aliquet porttitor lacus luctus accumsan tortor. Elit sed vulputate mi sit amet mauris commodo quis imperdiet. A pellentesque sit amet porttitor. Amet massa vitae tortor condimentum lacinia quis vel eros donec. Vulputate dignissim suspendisse in est ante in nibh mauris. Ultrices gravida dictum fusce ut placerat orci nulla. Ac placerat vestibulum lectus mauris ultrices eros. Malesuada nunc vel risus commodo viverra maecenas accumsan. Et netus et malesuada fames. Ut enim blandit volutpat maecenas volutpat blandit. Neque ornare aenean euismod elementum nisi quis eleifend quam. Cras ornare arcu dui vivamus arcu. Eu facilisis sed odio morbi quis commodo odio aenean. Ac orci phasellus egestas tellus rutrum. Tincidunt praesent semper feugiat nibh sed pulvinar proin gravida. Orci sagittis eu volutpat odio facilisis mauris sit amet massa. Eu consequat ac felis donec et odio pellentesque. Dictumst quisque sagittis purus sit amet. Eget nulla facilisi etiam dignissim. Scelerisque eu ultrices vitae auctor eu augue ut. Ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae. Pretium aenean pharetra magna ac placerat vestibulum. Morbi enim nunc faucibus a. Mattis aliquam faucibus purus in massa tempor nec feugiat. Eu consequat ac felis donec et odio pellentesque diam. Interdum posuere lorem ipsum dolor. Et malesuada fames ac turpis egestas integer eget. Aliquet risus feugiat in ante metus dictum. Urna nunc id cursus metus aliquam eleifend mi in. Velit dignissim sodales ut eu sem integer vitae. Tempor commodo ullamcorper a lacus vestibulum sed arcu. Tristique senectus et netus et malesuada fames. Vitae tortor condimentum lacinia quis vel. A erat nam at lectus urna duis convallis. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt. Libero id faucibus nisl tincidunt eget nullam non nisi. Dui nunc mattis enim ut tellus elementum. Arcu odio ut sem nulla pharetra. Rhoncus est pellentesque elit ullamcorper dignissim cras. Sagittis nisl rhoncus mattis rhoncus. Mi bibendum neque egestas congue. Mauris pellentesque pulvinar pellentesque habitant. Felis eget velit aliquet sagittis id consectetur. Vitae turpis massa sed elementum. Fames ac turpis egestas integer eget aliquet nibh praesent tristique. Tempus iaculis urna id volutpat lacus laoreet non curabitur. Enim facilisis gravida neque convallis. Pellentesque sit amet porttitor eget dolor morbi non arcu. Magna etiam tempor orci eu. Felis bibendum ut tristique et egestas quis. Leo urna molestie at elementum eu facilisis sed odio. Sed libero enim sed faucibus. Scelerisque mauris pellentesque pulvinar pellentesque habitant. Scelerisque eu ultrices vitae auctor eu augue ut. Lorem ipsum dolor sit amet consectetur. Auctor eu augue ut lectus arcu bibendum at varius. Nullam non nisi est sit amet facilisis. Amet venenatis urna cursus eget nunc scelerisque. Risus at ultrices mi tempus. Ut consequat semper viverra nam libero justo laoreet sit. Quis commodo odio aenean sed adipiscing diam donec. Tortor consequat id porta nibh venenatis cras sed felis eget. Molestie a iaculis at erat pellentesque adipiscing commodo elit at. Ullamcorper a lacus vestibulum sed arcu non odio euismod. Id volutpat lacus laoreet non curabitur gravida. Mauris ultrices eros in cursus turpis massa. Euismod elementum nisi quis eleifend quam adipiscing vitae. Tellus elementum sagittis vitae et leo duis. Id porta nibh venenatis cras. Placerat vestibulum lectus mauris ultrices eros in cursus turpis. Sed adipiscing diam donec adipiscing tristique risus nec feugiat. In ornare quam viverra orci sagittis eu volutpat odio facilisis. Id diam maecenas ultricies mi. Ac ut consequat semper viverra nam libero justo laoreet. Sed id semper risus in. In eu mi bibendum neque egestas congue. Sed blandit libero volutpat sed cras ornare arcu dui vivamus. Penatibus et magnis dis parturient montes. Mi ipsum faucibus vitae aliquet nec ullamcorper sit amet risus. Magna sit amet purus gravida. Turpis massa tincidunt dui ut ornare lectus sit amet. Lectus quam id leo in. Aliquet nibh praesent tristique magna sit amet. Lectus nulla at volutpat diam. Turpis egestas sed tempus urna et. Diam quis enim lobortis scelerisque fermentum dui faucibus. Nibh ipsum consequat nisl vel pretium lectus quam. Tellus at urna condimentum mattis pellentesque. Ullamcorper eget nulla facilisi etiam dignissim diam. Scelerisque viverra mauris in aliquam sem fringilla ut. Ut venenatis tellus in metus vulputate eu. Gravida neque convallis a cras semper auctor. Diam in arcu cursus euismod quis viverra nibh cras pulvinar. Interdum consectetur libero id faucibus nisl tincidunt eget.")
          ],
        ),
      );
}
