import 'package:flutter/material.dart';
import 'package:shareover/model/food_category.dart';
import 'package:shareover/pages/map/popups/subscription/category_multi_select.dart';

import '../../router.dart';

class SubscriptionWidget extends StatelessWidget {
  final Function(PopupType)? openPopup;

  const SubscriptionWidget({Key? key, required this.openPopup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Theme.of(context).dialogBackgroundColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => openPopup?.call(PopupType.notification),
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox.expand(child: SubscriptionForm()),
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({Key? key}) : super(key: key);

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  var selectedCategories = <String>[categories[1].categoryId];
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CategoryMultiSelectWidget(
          selectedCategories: selectedCategories,
          addCategory: (categoryId) {
            setState(() {
              selectedCategories.add(categoryId);
            });
          },
          removeCategory: (categoryId) {
            setState(() {
              selectedCategories.remove(categoryId);
            });
          },
        ),
        const Text("Distance in meter"),
        _Slider(
            value: _currentSliderValue,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            }),
        const Spacer(),
        Row(children: [
          Expanded(
            child: ElevatedButton(onPressed: () {}, child: const Text("Save")),
          )
        ])
      ],
    );
  }
}

class _Slider extends StatelessWidget {
  final double value;
  final String label;
  final Function(double) onChanged;

  const _Slider(
      {Key? key,
      required this.value,
      required this.label,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
      child: Slider(
        value: value,
        max: 800,
        divisions: 10,
        label: label,
        onChanged: onChanged,
      ),
    );
  }
}
