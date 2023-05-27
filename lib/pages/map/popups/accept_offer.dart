import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shareover/model/food_category.dart';
import 'package:shareover/pages/map/router.dart';
import 'package:shareover/services/api_service.dart';
import 'package:shareover_api/api.dart';

class AcceptOffer extends StatefulWidget {
  final Function(PopupType type, Object? popupData) openPopup;
  final VoidCallback reloadShop;
  final Offer offer;

  const AcceptOffer(
      {Key? key,
      required this.openPopup,
      required this.offer,
      required this.reloadShop})
      : super(key: key);

  @override
  State<AcceptOffer> createState() => _Popup();
}

class _Popup extends State<AcceptOffer> {
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();

    amountController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var category = getCategory(widget.offer.categoryId!);

    var valid = true;
    try {
      var amount = int.parse(amountController.text);
      if (amount == 0) {
        valid = false;
      }
    } catch (e) {
      valid = false;
    }

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: category.displayName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  text: "${widget.offer.units}x ${widget.offer.product}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                )),
            Container(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: amountController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: TextButton(
                    onPressed: () {
                      if (!valid) return;
                      APIService.of(context).offerApi.offerIdPost(
                          int.parse(widget.offer.id!),
                          amount: int.parse(amountController.text));
                      widget.reloadShop();
                      widget.openPopup.call(PopupType.closed, null);
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.background),
                      backgroundColor: valid
                          ? MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primary)
                          : MaterialStateProperty.all(
                              Theme.of(context).colorScheme.background),
                    ),
                    child: const Text("Submit"),
                  ),
                ),
              ),
            ]),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: TextButton(
                    onPressed: () {
                      widget.openPopup.call(PopupType.closed, null);
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.background),
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.error,
                      ),
                    ),
                    child: const Text("Cancel"),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
