import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class MealFavNotifier extends StateNotifier<List<Meal>> {
  MealFavNotifier() : super([]);

  bool ToogleFavMeal(Meal meal) {
    final MealisFav = state.contains(meal);
    if (MealisFav) {
      state = state
          .where((m) => m.id != meal.id)
          .toList(); // we need false to remove it thats why we are using != , jha jha true hoga wo list mei rahega ... jiska false hoga wo bahr hoajega
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final mealFavoriteProvider =
    StateNotifierProvider<MealFavNotifier, List<Meal>>((ref) {
  return MealFavNotifier();
});
