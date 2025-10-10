import 'package:flutter/material.dart';

import 'package:meals/models/category.dart';

/// Widget representing a single category item in the categories grid.
/// 
/// Displays a category with its title and color gradient background.
/// Handles tap events for category selection and provides visual
/// feedback with splash effects.
class CategoryGridItem extends StatelessWidget {
  /// Creates a category grid item widget.
  /// 
  /// [category] contains the category data to display.
  /// [onSelectCategoyr] callback triggered when the category is tapped.
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategoyr,
  });

  /// The category data to display in this grid item.
  final Category category;
  
  /// Callback function called when the category item is tapped.
  final void Function() onSelectCategoyr;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategoyr,
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
