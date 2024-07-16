import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(FilterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilter[Filter.gluten]!,
            onChanged: (ischecked) {
              ref
                  .read(FilterProvider.notifier)
                  .setFilter(Filter.gluten, ischecked);
            },
            title: Text(
              "Gluten-Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            activeColor: Colors.teal,
          ),
          SwitchListTile(
            value: activeFilter[Filter.lactos]!,
            onChanged: (ischecked) {
              ref
                  .read(FilterProvider.notifier)
                  .setFilter(Filter.lactos, ischecked);
            },
            title: Text(
              "Lactos-Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            activeColor: Colors.teal,
          ),
          SwitchListTile(
            value: activeFilter[Filter.veg]!,
            onChanged: (ischecked) {
              ref
                  .read(FilterProvider.notifier)
                  .setFilter(Filter.veg, ischecked);
            },
            title: Text(
              "Vegetarian",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            activeColor: Colors.teal,
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegan]!,
            onChanged: (ischecked) {
              ref
                  .read(FilterProvider.notifier)
                  .setFilter(Filter.vegan, ischecked);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            activeColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
