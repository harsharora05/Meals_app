import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meals_provider.dart';

enum Filter { gluten, lactos, veg, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.gluten: false,
          Filter.lactos: false,
          Filter.veg: false,
          Filter.vegan: false
        });

  void SetFilters(Map<Filter, bool> ActiveFilters) {
    state = ActiveFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final FilterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref) {
  return FilterNotifier();
});

final filterMealProvider = Provider((ref) {
  final meals = ref.watch(meal_provider);
  final activeFilter = ref.watch(FilterProvider);
  return meals.where((meal) {
    if (activeFilter[Filter.gluten]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactos]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilter[Filter.veg]! && !meal.isVegetarian) {
      return false;
    }

    return true;
  }).toList();
});
