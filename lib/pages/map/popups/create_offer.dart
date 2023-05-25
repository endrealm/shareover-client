import 'package:flutter/material.dart';
import 'package:shareover/model/food_category.dart';

class CreateOfferWidget extends StatelessWidget {
  final VoidCallback close;
  const CreateOfferWidget({Key? key, required this.close}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Container(
          color: Theme.of(context).dialogBackgroundColor,
          child: Column(
              children: [
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
                  child: SizedBox.expand(
                    child: CreateForm()
                  ),
                ),
              ]
          ),
        )
    );
  }
}


class CreateForm extends StatefulWidget {
  const CreateForm({Key? key}) : super(key: key);

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {

  var selectedCategory = categories[0].categoryId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Select a category"),
        Wrap(
          spacing: 5.0,
          children: categories.map(
                  (category) =>  ChoiceChip(
                    label: Text(category.displayName),
                    selected: category.categoryId == selectedCategory,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategory = category.categoryId;
                      });
                    },
                  ),
          ).toList(),
        ),

      ],
    );
  }
}

