
import 'package:flutter/material.dart';
import 'package:shareover/components/offer.dart';
import 'package:shareover/pages/map/router.dart';
import 'package:shareover/services/api_service.dart';
import 'package:shareover_api/api.dart';

class NotificationWidget extends StatelessWidget {
  final VoidCallback close;
  final Function(PopupType)? openPopup;

  const NotificationWidget(
      {Key? key, required this.close, required this.openPopup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Container(
      padding: const EdgeInsets.all(8),
      color: Theme.of(context).dialogBackgroundColor,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => openPopup?.call(PopupType.subscription),
              backgroundColor: Colors.blue,
              child: const Icon(Icons.settings),
            ),
            const Spacer(),
            FloatingActionButton(
              onPressed: close,
              backgroundColor: Colors.green,
              child: const Icon(Icons.close),
            ),
          ],
        ),
        const Expanded(
          child: SizedBox.expand(child: NotificationList()),
        ),
      ]),
    ));
  }
}

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  final List<Offer> offerList = [];



  @override
  void initState() {
    super.initState();
    var notifications =
        APIService.of(context).notificationApi.notificationGet(since: "12:00");
    offerList.addAll(notifications as Iterable<Offer>);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: offerList.length,
      itemBuilder: (_, index) => OfferWidget(
        offer: offerList[index],
        canBeDeleted: true,
        onDelete: () {
          setState(() {
            offerList.remove(offerList[index]);
            // TODO remove from server
          });
        },
      ),
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
