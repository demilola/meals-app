import 'package:flutter/material.dart';
import 'package:meals_app/models/drawer.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/models/tab.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //a list of nav items
  final List<TabNavigationItem> tabs = [
    TabNavigationItem(
      page: CategoriesScreen(),
      icon: Icon(Icons.category),
      title: Text("Categories"),
    ),
    TabNavigationItem(
      page: FavoritesScreen(widget.favoriteMeals),
      icon: Icon(Icons.favorite),
      title: Text("Favorites"),
    ),
  ];

  int _selectedPageIndex = 0;

//called when a navbutton is tapped/pressed/clicked. Chanes index to control whats on the screen
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: tabs[_selectedPageIndex].title,
      ),
      drawer: MainDrawer(),
      body: IndexedStack(
        index: _selectedPageIndex,
        children: [
          //a for in loop to populate the indexedstack with pages
          for (final tab in tabs) tab.page,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.black87,
        currentIndex: _selectedPageIndex,
        items: [
          for (final tab in tabs)
            BottomNavigationBarItem(
              icon: tab.icon,
              title: tab.title,
            )
        ],
      ),
    );
  }
}
