import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(child: Text('Nothing to see yet'))
        : ListView.builder(
              itemCount: favoriteMeals.length,
              itemBuilder: (ctx, index) => MealItem(
                meal: favoriteMeals[index],
              ),
            );
  }
}