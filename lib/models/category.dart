import 'package:flutter/material.dart';

/// Represents a meal category in the app.
/// 
/// Each category has a unique identifier, display title, and associated color
/// for visual distinction in the UI. Categories are used to organize and
/// filter meals by cuisine type or dietary preference.
class Category {
  /// Creates a new category instance.
  /// 
  /// [id] must be unique across all categories.
  /// [title] is the display name shown in the UI.
  /// [color] defaults to orange if not specified.
  const Category({
    required this.id,
    required this.title,
    this.color = const Color.fromRGBO(255, 152, 0, 1),
  });

  /// Unique identifier for this category.
  final String id;

  /// Display title shown in the category grid.
  final String title;

  /// Color used for the category tile background gradient.
  final Color color;
}
