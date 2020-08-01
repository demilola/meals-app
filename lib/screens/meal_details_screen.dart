import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String id = '/MealDetailsScreen';

  @override
  Widget build(BuildContext context) {
    //Accepting passed argument(s):
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Column(
        children: [
          // Hero(
          //   tag: 'mealImage',
          //   child:
          Image.network(
            meal.imageUrl,
            height: 250.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // ),
          Expanded(
            child: ListView(
              children: [
                Container(
                    margin: const EdgeInsets.all(4.0),
                    child: Text(
                      'Ingredients:',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
,                      textAlign: TextAlign.center,
                    )),
                ...meal.ingredients
                    .map((ingredient) => Text(
                          ingredient,
                          textAlign: TextAlign.center,
                        ))
                    .toList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
