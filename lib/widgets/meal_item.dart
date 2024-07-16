import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0] + meal.complexity.name.substring(1);
  }

  String get AffordabilityText {
    return meal.affordability.name[0] + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MealDetailScreen(mealItem: meal);
        }));
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Color.fromARGB(115, 0, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Row(
                        children: [
                          MealTraitItem(
                              icon: Icons.timer,
                              label: '${meal.duration} mins'),
                          MealTraitItem(
                              icon: Icons.work, label: complexityText),
                          MealTraitItem(
                              icon: Icons.attach_money,
                              label: AffordabilityText)
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
