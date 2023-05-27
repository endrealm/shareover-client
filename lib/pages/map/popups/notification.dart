
import 'package:flutter/material.dart';
import 'package:shareover/components/offer.dart';
import 'package:shareover/pages/map/router.dart';
import 'package:shareover/services/api_service.dart';
import 'package:shareover_api/api.dart';

class NotificationWidget extends StatelessWidget {
  final VoidCallback close;
  final Function(PopupType, Object?)? openPopup;

  const NotificationWidget(
      {Key? key, required this.close, required this.openPopup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Container(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () =>
                      openPopup?.call(PopupType.subscription, null),
                  child: const Icon(Icons.saved_search),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: close,
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox.expand(child: NotificationList()),
            ),
          ],
        ),
      ),
    );
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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    APIService.of(context).notificationApi.notificationGet().then((value) {
      setState(() {
        offerList.clear();
        offerList.addAll(value!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if(offerList.isEmpty) {
      return const Center(
        child: Text("Its empty here try subscribing to a category!"),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: offerList.length,
      itemBuilder: (_, index) => OfferWidget(
        offer: offerList[index],
        canBeDeleted: true,
        onDelete: () {
          setState(() {
            offerList.remove(offerList[index]);
            APIService.of(context)
                .notificationApi
                .notificationIdDelete(offerList[index].id!);
          });
        },
      ),
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
