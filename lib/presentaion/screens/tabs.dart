import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/presentaion/screens/categories.dart';
import 'package:meals/presentaion/screens/filters.dart';
import 'package:meals/presentaion/screens/meals.dart';
import 'package:meals/presentaion/widgets/fliters_list.dart';
import 'package:meals/presentaion/widgets/main_drawer.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0; // hold page index

  final List<Meal> _favoriteMeals = []; // List that hold _favoriteMeals

  Map<Filter, bool> _selectedFilters = kInitialFilter;

  /// improving UX by adding snackBar when add/delete meal from favorite
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
      _showSnackBar('Meal Deleted From Favorites');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showSnackBar('Meal Added To Favorites');
    }
  }

  /// change page index to switch tap in the BottomNavigationBar.
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreenForListTile(String identefier) async {
    Navigator.of(context).pop(); // close drawer

    if (identefier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(currentFilter: _selectedFilters),
        ),
      );
      
      setState(() {
        _selectedFilters = result ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) return false;
      return true;
    }).toList();

    /// object hold current active page
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
      onToggleFavorite: _toggleMealFavoriteStatus,
    );

    var activePageTitle = 'Categories'; // hold activePageTitle

    /// switch to filtered MealsScreen based on favourites when Favorites buttom pressed in the BottomNavigationBar.
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals, // filtered MealsScreen based on favourites
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites'; // appBar title
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectMeals: _setScreenForListTile),
      body: activePage, // current active page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          // for Categories buttom
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),

          // for Favorites buttom
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
