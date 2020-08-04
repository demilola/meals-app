import 'package:flutter/material.dart';

//Class for creating nav items
class TabNavigationItem {
  final Widget page;
  final Text title;
  final Icon icon;


//contains the page, a title and icon. Might implement other properties too in the future
  const TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });
}
