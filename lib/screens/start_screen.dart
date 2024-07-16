import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filter_provider.dart';
import 'package:meals_app/provider/meal_fav_provider.dart';
import 'package:meals_app/screens/meal_categories_screen.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/drawer_main.dart';
import 'package:meals_app/screens/filter_screen.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  int currIndex = 0;

  onTap(int value) {
    setState(() {
      currIndex = value;
      if (currIndex == 1) {}
    });
  }

  void _setScreens(String Identfier) async {
    Navigator.pop(context);
    if (Identfier == 'filters') {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return const FilterScreen();
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final available_meals = ref.watch(filterMealProvider);

    final Favorite_meal = ref.watch(mealFavoriteProvider);
    List<Widget> screens = [
      CategoryScreen(
        filtered_meals: available_meals,
      ),
      CategoryMealScreen(meal_list: Favorite_meal)
    ];
    return Scaffold(
      appBar: AppBar(
        title: currIndex == 0
            ? const Text("Pick Your Category")
            : const Text("Your Favorite"),
      ),
      drawer: DrawerMain(
        onToggleScreen: _setScreens,
      ),
      body: screens[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        iconSize: 29,
        currentIndex: currIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourite")
        ],
      ),
    );
  }
}
