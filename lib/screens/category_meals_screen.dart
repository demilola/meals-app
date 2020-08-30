import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String id = 'CategoryMealsScreen';
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool loadedInitData = false;

  // @override
  // void initState() {
  //   //..
  //   super.initState();
  // }

//had to use didChangeDependencies because ModalRoute.of(context) uses inherited widget
  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      //passed from category item
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArguments['categoryTitle'];
      String categoryId = routeArguments['categoryID'];
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() => displayedMeals.removeWhere((meal) => meal.id == mealId));
  // }

  @override
  Widget build(BuildContext context) {
    /*Create a final variable that accesses the args passed from the named route. With this, there's no need for a constructor
    To be able to access this info with [], we have to tell flutter that the object is a Map of strings*/
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      //Check if there are any meals to show, if there are, build a listview, if not, display some text
      body: displayedMeals.isNotEmpty
          ? ListView.builder(
              itemCount: displayedMeals.length,
              itemBuilder: (ctx, index) => MealItem(
                meal: displayedMeals[index],
              ),
            )
          : Center(
              child: Text('No Meals To Show'),
            ),
    );
  }
}
