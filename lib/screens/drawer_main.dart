import 'package:flutter/material.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key, required this.onToggleScreen});

  final void Function(String identifier) onToggleScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.onPrimaryFixedVariant,
              Theme.of(context).colorScheme.onPrimary
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.restaurant,
                  size: 35,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text("Cooking Up!",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface))
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.food_bank,
              size: 35,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            onTap: () {
              onToggleScreen("meals");
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 35,
            ),
            title: Text(
              "Filter",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            onTap: () {
              onToggleScreen("filters");
            },
          ),
        ],
      ),
    );
  }
}
