import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String id = 'CategoryMealsScreen';

  @override
  Widget build(BuildContext context) {
    /*Create a final variable that accesses the ars passed from the named route. With this, there's no need for a constructor
    To be able to access this info with [], we have to tell flutter that the object is a Map of strings*/
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArguments['categoryTitle']),
      ),
      body: Center(
        child: Text(routeArguments['categoryID']),
      ),
    );
  }
}
