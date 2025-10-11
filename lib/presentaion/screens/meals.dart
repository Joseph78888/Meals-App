import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/presentaion/screens/meal_details.dart';
import 'package:meals/presentaion/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal)
  onToggleFavorite; // pointer to _toggleMealFavoriteStatus function in tabsScreen widget.

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (meal) {
          _selectMeal(context, meal);
        },
      ),
      itemCount: meals.length, // no. of items
    );

    if (meals.isEmpty) {
      // when no meals are available
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'uh no ... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            
            const SizedBox(height: 16),
            Text(
              'try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
      );
    }

    /// this Block cheke if the title set or not => to handel
    /// start button on BottomNavigationBarItem so that we don't get two app bars.
    {
      if (title == null) {
        // return the content without scaffold
        return content;
      }

      // return the content with scaffold
      return Scaffold(
        appBar: AppBar(title: Text(title!)),
        body: content,
      );
    }
  }
}
