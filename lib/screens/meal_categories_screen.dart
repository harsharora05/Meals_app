import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({super.key, this.title, required this.meal_list});

  final String? title;
  final List<Meal> meal_list;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Oops!!!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.white),
          ),
          Text(
            "No Meal Found For This Category :( ",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
    if (meal_list.isNotEmpty) {
      content = ListView.builder(
          itemCount: meal_list.length,
          itemBuilder: (context, index) {
            final meal = meal_list[index];
            return MealItem(meal: meal);
          });
    }

    if (title == null) {
      return content;
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(title!),
          ),
          body: content);
    }
  }
}
