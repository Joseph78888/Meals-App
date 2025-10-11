import 'package:flutter/material.dart';

/// enum hold the filters value after pop the filter screen so the values stored
enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FlitersList extends StatefulWidget {
  const FlitersList({super.key, required this.currentFilter});
    final Map<Filter, bool> currentFilter;

  @override
  State<FlitersList> createState() => _FlitersListState();
}

class _FlitersListState extends State<FlitersList> {
  // false by defaulte
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilter[Filter.lactoseFree]!;
    _vegetarianFreeFilterSet = widget.currentFilter[Filter.vegetarian]!;
    _veganFreeFilterSet = widget.currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, dynamic result) {
        if (didPop) return;

        // maping the value when close the filter screen.
        Navigator.of(context).pop({
          Filter.glutenFree: _glutenFreeFilterSet,
          Filter.lactoseFree: _lactoseFreeFilterSet,
          Filter.vegetarian: _vegetarianFreeFilterSet,
          Filter.vegan: _veganFreeFilterSet,
        });
      },

      child: Column(
        children: [
          // Glouten-Free
          SwitchListTile(
            value: _glutenFreeFilterSet,

            onChanged: (isChanged) => setState(() {
              _glutenFreeFilterSet = isChanged;
            }),

            title: Text(
              'Glouten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            subtitle: Text(
              'only include Glouten-Free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),

          // Lactose-Free'
          SwitchListTile(
            value: _lactoseFreeFilterSet,

            onChanged: (isChanged) => setState(() {
              _lactoseFreeFilterSet = isChanged;
            }),

            title: Text(
              'Lactose-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            subtitle: Text(
              'only include Lactose-Free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),

          // Vegetarian
          SwitchListTile(
            value: _vegetarianFreeFilterSet,

            onChanged: (isChanged) => setState(() {
              _vegetarianFreeFilterSet = isChanged;
            }),

            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            subtitle: Text(
              'only include Vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),

          // vegan
          SwitchListTile(
            value: _veganFreeFilterSet,

            onChanged: (isChanged) => setState(() {
              _veganFreeFilterSet = isChanged;
            }),

            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            subtitle: Text(
              'only include Vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
