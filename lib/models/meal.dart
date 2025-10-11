/// Represents the difficulty level of preparing a meal.
enum Complexity { 
  /// Easy to prepare, minimal cooking skills required
  simple, 
  /// Moderate difficulty, some cooking experience needed
  challenging, 
  /// Advanced techniques required, expert level
  hard 
}

/// Represents the cost level of ingredients for a meal.
enum Affordability { 
  /// Budget-friendly ingredients
  affordable, 
  /// Mid-range priced ingredients
  pricey, 
  /// Expensive, premium ingredients
  luxurious 
}

/// Represents a meal recipe with all its details.
/// 
/// Contains comprehensive information about a meal including ingredients,
/// preparation steps, dietary information, and metadata like complexity
/// and affordability. Used throughout the app for displaying recipe
/// information and filtering.
class Meal {
  /// Creates a new meal instance with all required properties.
  /// 
  /// All parameters are required and must be provided when creating a meal.
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  /// Unique identifier for this meal.
  final String id;

  /// List of category IDs this meal belongs to.
  final List<String> categories;

  /// Display name of the meal.
  final String title;

  /// URL to the meal's image.
  final String imageUrl;

  /// List of ingredients required for this meal.
  final List<String> ingredients;

  /// Step-by-step cooking instructions.
  final List<String> steps;

  /// Cooking time in minutes.
  final int duration;

  /// Difficulty level of preparing this meal.
  final Complexity complexity;

  /// Cost level of ingredients for this meal.
  final Affordability affordability;

  /// Whether this meal is gluten-free.
  final bool isGlutenFree;

  /// Whether this meal is lactose-free.
  final bool isLactoseFree;

  /// Whether this meal is vegan.
  final bool isVegan;

  /// Whether this meal is vegetarian.
  final bool isVegetarian;
}
