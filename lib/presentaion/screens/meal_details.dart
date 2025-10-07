import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
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
          ],
        ),
      ),
    );
  }
}
