class FoodCategory {
  final String categoryId;
  final String displayName;

  FoodCategory({required this.categoryId, required this.displayName});
}

final categories = [
  FoodCategory(categoryId: "bread", displayName: "Bread"),
  FoodCategory(categoryId: "dairy", displayName: "Dairy"),
  FoodCategory(categoryId: "fruits", displayName: "Fruits"),
  FoodCategory(categoryId: "vegetable", displayName: "Vegetable"),
  FoodCategory(categoryId: "fish", displayName: "Fish"),
  FoodCategory(categoryId: "meat", displayName: "Meat"),
  FoodCategory(categoryId: "consumer_goods", displayName: "Consumer Goods"),
];