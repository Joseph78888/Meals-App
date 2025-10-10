import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/presentaion/screens/meals.dart';
import 'package:meals/presentaion/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

/// Screen displaying meal categories in a grid layout.
/// 
/// Shows all available meal categories with their associated colors.
/// When a category is tapped, navigates to a filtered list of meals
/// belonging to that category.
class CategoriesScreen extends StatelessWidget {
  /// Creates the categories screen.
  /// 
  /// [availableMeals] are filtered based on current dietary preferences.
  /// [onToggleFavorite] callback for managing favorite meals.
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});

  /// List of meals available after applying dietary filters.
  final List<Meal> availableMeals;
  
  /// Callback function for toggling meal favorite status.
  final void Function(Meal meal) onToggleFavorite;

  /// Handles category selection and navigation to filtered meals.
  /// 
  /// Filters meals by the selected category ID and navigates to
  /// the meals screen with the filtered results.
  void _selectCategoyr(BuildContext context, Category category) {
    // Filter meals based on category ID
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    
    // Navigate to Meals Screen with filtered results
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
