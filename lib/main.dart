import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.id: (context) => CategoryMealsScreen(),
        MealDetailsScreen.id: (context) => MealDetailsScreen(),
        CategoriesScreen.id: (context) => CategoriesScreen(),
      },
      // onGenerateRoute: (settings) =>
      //     MaterialPageRoute(builder: (context) => CategoriesScreen()),
      // onUnknownRoute: (settings) =>
      //     MaterialPageRoute(builder: (context) => CategoriesScreen()),
    );
  }
}
