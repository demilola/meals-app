import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String id = 'CategoryMealsScreen';

  @override
  Widget build(BuildContext context) {
    /*Create a final variable that accesses the ars passed from the named route. With this, there's no need for a constructor
    To be able to access this info with [], we have to tell flutter that the object is a Map of strings*/
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryId = routeArguments['categoryID'];

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(routeArguments['categoryTitle']),
        ),
        body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) => MealItem(meal:categoryMeals[index]),
        ));
  }
}
