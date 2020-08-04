import 'package:flutter/material.dart';
import 'package:meals_app/models/drawer.dart';
import 'package:meals_app/models/tab.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
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
      page: FavoritesScreen(),
      icon: Icon(Icons.favorite),
      title: Text("Favorites"),
    ),
  ];

  //a list of drawer items
  final List<DrawerItem> drawerItems = [
    DrawerItem(
      page: CategoriesScreen(),
      icon: Icon(Icons.restaurant),
      title: Text("Meals"),
    ),
    DrawerItem(
      page: FavoritesScreen(),
      icon: Icon(Icons.settings),
      title: Text("Filters"),
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
      drawer: Drawer(
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
              ListTile(leading: item.icon, title: item.title),
          ],
        ),
      ),
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
