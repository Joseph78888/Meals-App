import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/presentaion/screens/meals.dart';
import 'package:meals/presentaion/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  /// triegerd when select (tap) category
  void _selectCategoyr(BuildContext context, Category category) {
    // filtering the list base on category id
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    // navigate to Meals Screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pick your meal')),
      body: GridView(
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
      ),
    );
  }
}
