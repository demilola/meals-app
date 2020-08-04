import 'package:flutter/material.dart';
import 'package:meals_app/models/drawer.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  //a list of drawer items
  final List<DrawerItem> drawerItems = [
    DrawerItem(
        page: CategoriesScreen(),
        icon: Icon(Icons.restaurant),
        title: Text("Meals"),
        route: '/'),
    DrawerItem(
        page: FiltersScreen(),
        icon: Icon(Icons.settings),
        title: Text("Filters"),
        route: FiltersScreen.id),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          for (DrawerItem item in drawerItems)
            ListTile(
                leading: item.icon,
                title: item.title,
                onTap: () => Navigator.pushReplacementNamed(
                      context,
                      item.route,
                    )),
        ],
      ),
    );
  }
}
