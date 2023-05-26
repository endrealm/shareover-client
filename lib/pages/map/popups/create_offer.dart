import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shareover/model/food_category.dart';

class CreateOfferWidget extends StatelessWidget {
  final VoidCallback close;

  const CreateOfferWidget({Key? key, required this.close}) : super(key: key);

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
              onPressed: close,
              backgroundColor: Colors.green,
              child: const Icon(Icons.close),
            ),
          ],
        ),
        const Expanded(
          child: SizedBox.expand(child: CreateForm()),
        ),
      ]),
    ));
  }
}

class CreateForm extends StatefulWidget {
  const CreateForm({Key? key}) : super(key: key);

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  var selectedCategory = categories[0].categoryId;
  late TextEditingController _controller;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Select a category"),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Wrap(
            spacing: 6.0,
            children: categories.map(
              (category) {
                var selected = category.categoryId == selectedCategory;
                return ChoiceChip(
                  avatar: !selected ? category.icon : const SizedBox.shrink(),
                  label: Text(category.displayName),
                  selected: selected,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedCategory = category.categoryId;
                    });
                  },
                );
              },
            ).toList(),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Product Name",
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                // onTapOutside: (_) {
                //   _amountController.text = int.parse(_amountController.text).toString();
                // },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Amount",
                ),
              ),
            )
          ],
        ),
        const Spacer(),
        Row(children: [
          Expanded(
            child:
                ElevatedButton(onPressed: () {}, child: const Text("Submit")),
          )
        ])
      ],
    );
  }
}
