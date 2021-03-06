import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String id = '/MealDetailsScreen';

  final Function _toggleFavorites;
  final Function _isFavorite;

  const MealDetailsScreen(this._toggleFavorites, this._isFavorite);

  Container _buildSectionTitle(BuildContext context, String title) => Container(
      margin: const EdgeInsets.all(4.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ));

  Widget _buildContainer(Widget child) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    //Accepting passed argument(s):
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.pop(context, meal.id),
        onPressed: () => _toggleFavorites(meal),
        child: Icon(_isFavorite(meal)?Icons.favorite:Icons.favorite_border),
      ),
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
          _buildSectionTitle(context, 'Ingredients:'),
//Wrapped the listView here with Expanded to avoid errors like height was unbounded
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(meal.ingredients[index])),
              ),
              itemCount: meal.ingredients.length,
            ),
          ),

          _buildSectionTitle(context, 'Steps'),
          _buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(
                      meal.steps[index],
                    ),
                  ),
                  Divider()
                ],
              ),
              itemCount: meal.steps.length,
            ),
          ),
        ],
      ),
    );
  }
}
