import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_categories_screen.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {super.key, required this.category, required this.filtered_meals});

  final Category category;
  final List<Meal> filtered_meals;

  void _selectedCategory(BuildContext context) {
    final selected_category = filtered_meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => CategoryMealScreen(
                  title: category.title,
                  meal_list: selected_category,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectedCategory(context);
      },
      splashColor: Theme.of(context).primaryColorDark,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category.color.withOpacity(.55),
                category.color.withOpacity(.9)
              ]),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer),
        ),
      ),
    );
  }
}
