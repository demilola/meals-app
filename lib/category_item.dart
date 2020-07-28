import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key key, this.title, this.color, this.id})
      : super(key: key);

  final String title;
  final Color color;
  final String id;

  void _selectCategory(context) {
    //Since we are pushing a named route, it is impossible to use constructor args to pass data, hence we use [arguments] and create a map with the data we want to pass
    Navigator.pushNamed(
      context,
      CategoryMealsScreen.id,
      arguments: {
        'categoryID': id,
        'categoryTitle': title,
      },
      // MaterialPageRoute(builder: (_) => CategoryMealsScreen(categoryID: id,categoryTitle: title,))
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.70),
                color,
              ],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Text(title),
      ),
    );
  }
}
