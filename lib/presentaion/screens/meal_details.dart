import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';

/// Screen displaying detailed information about a selected meal.
/// 
/// Shows the meal image, ingredients list, and step-by-step cooking
/// instructions. Includes a favorite button in the app bar for
/// toggling the meal's favorite status.
class MealDetailsScreen extends StatelessWidget {
  /// Creates the meal details screen.
  /// 
  /// [meal] contains all the recipe information to display.
  /// [onToggleFavorite] callback for managing favorite status.
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  /// The meal recipe to display detailed information for.
  final Meal meal;
  
  /// Callback function for toggling meal favorite status.
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            /// pass pointer to _toggleMealFavoriteStatus function in tabsScreen widget.
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: Icon(Icons.star),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            // Ingredients title section
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 12,
                vertical: 8,
              ),

              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Ingredients list section
            for (final ingredient in meal.ingredients)
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),

                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),

            // steps title section
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 12,
                vertical: 8,
              ),

              child: Text(
                'steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // steps list section
            for (final step in meal.steps)
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
