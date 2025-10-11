import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/presentaion/screens/meals.dart';
import 'package:meals/presentaion/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});

  final List<Meal> availableMeals;
  final void Function(Meal meal)
  onToggleFavorite; // pointer to _toggleMealFavoriteStatus function in tabsScreen widget.

  /// triegerd when select (tap) category
  void _selectCategoyr(BuildContext context, Category category) {
    // filtering the list base on category id
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    // navigate to Meals Screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategoyr: () {
              _selectCategoyr(context, category);
            },
          ),
      ],
    );
  }
}
