import 'package:flutter/material.dart';

class FlitersList extends StatefulWidget {
  const FlitersList({super.key});

  @override
  State<FlitersList> createState() => _FlitersListState();
}

class _FlitersListState extends State<FlitersList> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
