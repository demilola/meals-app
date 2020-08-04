import 'package:flutter/material.dart';
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
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
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
