import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = const Color.fromRGBO(255, 152, 0, 1),
  });

  final String id;
  final String title;
  final Color color;
}
