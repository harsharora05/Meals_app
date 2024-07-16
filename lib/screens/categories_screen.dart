import 'package:flutter/material.dart';
import 'package:meals_app/data/categories.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.filtered_meals});

  final List<Meal> filtered_meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: availableCategories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
            itemBuilder: (context, index) {
              final category_item = availableCategories[index];
              return CategoryItem(
                  filtered_meals: filtered_meals,
                  category: category_item,
                  key: ValueKey(category_item.id));
            }),
      ),
    );
  }
}
