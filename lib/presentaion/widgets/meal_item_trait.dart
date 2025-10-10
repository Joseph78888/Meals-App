import 'package:flutter/material.dart';

/// Widget displaying a meal attribute with an icon and label.
/// 
/// Used to show meal characteristics like duration, complexity, and
/// affordability in a consistent format across meal items.
class MealItemTrait extends StatelessWidget {
  /// Creates a meal item trait widget.
  /// 
  /// [icon] the icon to display next to the label.
  /// [label] the text label describing the trait.
  const MealItemTrait({super.key, required this.icon, required this.label});

  /// The icon to display for this trait.
  final IconData icon;
  
  /// The text label describing this trait.
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
