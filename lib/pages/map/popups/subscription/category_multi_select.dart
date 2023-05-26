import 'package:flutter/material.dart';
import 'package:shareover/model/food_category.dart';

class CategoryMultiSelectWidget extends StatelessWidget {
  final List<String> selectedCategories;
  final Function(String) addCategory;
  final Function(String) removeCategory;

  const CategoryMultiSelectWidget({
    Key? key,
    required this.selectedCategories,
    required this.addCategory,
    required this.removeCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      children: categories.map(
        (category) {
          var selected = selectedCategories.contains(category.categoryId);
          return ChoiceChip(
            avatar: !selected ? category.icon : const SizedBox.shrink(),
            label: Text(category.displayName),
            selected: selected,
            onSelected: (_) {
              if (selected) {
                removeCategory(category.categoryId);
                return;
              }
              addCategory(category.categoryId);
            },
          );
        },
      ).toList(),
    );
  }
}
