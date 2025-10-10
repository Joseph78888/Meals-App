import 'package:flutter/material.dart';
import 'package:meals/presentaion/widgets/fliters_list.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: FlitersList(),
    );
  }
}
