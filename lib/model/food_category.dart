import 'package:flutter/material.dart';

class FoodCategory {
  final String categoryId;
  final String displayName;
  late final Icon icon;

  FoodCategory(
      {required this.categoryId,
      required this.displayName,
      required IconData iconData}) {
    icon = Icon(iconData);
  }
}

final categories = [
  FoodCategory(
      categoryId: "bread", displayName: "Bread", iconData: Icons.bakery_dining),
  FoodCategory(categoryId: "dairy", displayName: "Dairy", iconData: Icons.egg),
  FoodCategory(
      categoryId: "fruits",
      displayName: "Fruits",
      iconData: Icons.auto_awesome),
  FoodCategory(
      categoryId: "vegetable", displayName: "Vegetable", iconData: Icons.grass),
  FoodCategory(
      categoryId: "fish", displayName: "Fish", iconData: Icons.set_meal),
  FoodCategory(
      categoryId: "meat", displayName: "Meat", iconData: Icons.directions_run),
  FoodCategory(
      categoryId: "consumer_goods",
      displayName: "Consumer Goods",
      iconData: Icons.storefront),
];