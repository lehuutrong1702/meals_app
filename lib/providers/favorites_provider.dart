import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritiesNotifier extends StateNotifier<List<Meal>> {
  FavoritiesNotifier() : super([]);

  void toggleFavoriteMeal(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((element) {
        return meal.id != element.id;
      }).toList();
    } else {
        state = [...state,meal];
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoritiesNotifier,List<Meal>> ((ref) {
  return FavoritiesNotifier();
});

