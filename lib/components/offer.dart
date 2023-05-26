import 'package:flutter/material.dart';
import 'package:shareover/model/food_category.dart';
import 'package:shareover_api/api.dart';

class OfferWidget extends StatelessWidget {
  final Offer offer;
  final bool canBeDeleted;
  final VoidCallback? onDelete;
  final VoidCallback? onClick;

  const OfferWidget({
    Key? key,
    required this.offer,
    this.canBeDeleted = false,
    this.onDelete,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var category = getCategory(offer.categoryId!);
    var theme = Theme.of(context);
    return ListTile(
      onTap: onClick,
      leading: category.icon,
      title:
          Text(category.displayName, style: TextStyle(color: theme.colorScheme.onBackground)),
      subtitle: Text(
          "${offer.units}x ${offer.product} \n ${offer.from} - ${offer.to} Uhr", style: TextStyle(color: theme.colorScheme.onBackground)),
      trailing: canBeDeleted
          ? IconButton(
              icon: Icon(
                Icons.delete,
                color: theme.colorScheme.error,
              ),
              onPressed: onDelete,
            )
          : const SizedBox.shrink(),
    );
  }
}
