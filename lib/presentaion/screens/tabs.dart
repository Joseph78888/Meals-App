import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/presentaion/screens/categories.dart';
import 'package:meals/presentaion/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0; // hold page index
  final List<Meal> _favoriteMeals = []; // List that hold _favoriteMeals

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 3)),
    );
  }

  /// check if the meal on the favorite list or not, if yes => remove it, if no => add it |
  /// all about the favorite buttom on MealDeatailesScreen.
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showSnackBar('Meal deleted from favorites');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showSnackBar('Meal added to favorites');
    }
  }

  /// change page index to switch tap in the BottomNavigationBar.
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// object hold current active page
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
    );

    var activePageTitle = 'Categories'; // hold activePageTitle

    /// switch to MealsScreen when Favorites buttom pressed in the BottomNavigationBar.
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage, // current active page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
