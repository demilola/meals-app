import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      //To accept whatever new set of values is passed from whewrever as filters
      _filters = filterData;
      //To make a new list implementing the new filters
      availableMeals = DUMMY_MEALS.where((meal) {
        //This piece of logic checks if we're filtering to get only gluten free meals, if we are, then check if the meal isn't gluten free,
        //if it's not gluten-free, return false and the meal wont show up
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // accentColor: Colors.lime,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: GoogleFonts.ralewayTextTheme().copyWith(
          bodyText1: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
          ).apply(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
          ).apply(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
          ).apply(color: Color.fromRGBO(20, 51, 51, 1)),
        ),
        typography: Typography.material2018(),
        // fontFamily: GoogleFonts.raleway().fontFamily,
        // accentTextTheme: GoogleFonts.robotoCondensedTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            textTheme: GoogleFonts.robotoCondensedTextTheme().copyWith(
              headline6: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.robotoCondensed().fontFamily,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            )),
      ),
      // home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.id: (context) =>
            CategoryMealsScreen(availableMeals),
        MealDetailsScreen.id: (context) => MealDetailsScreen(),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        FiltersScreen.id: (context) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) =>
      //     MaterialPageRoute(builder: (context) => CategoriesScreen()),
      // onUnknownRoute: (settings) =>
      //     MaterialPageRoute(builder: (context) => CategoriesScreen()),
    );
  }
}
