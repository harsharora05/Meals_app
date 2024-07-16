import 'package:meals_app/data/meals.dart';
import 'package:riverpod/riverpod.dart';

final meal_provider = Provider((ref) {
  return dummyMeals;
});
