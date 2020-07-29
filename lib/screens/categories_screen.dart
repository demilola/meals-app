import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeal'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.00,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 8.00,
          mainAxisSpacing: 8.00,
        ),
        padding: const EdgeInsets.all(8.00),
        children: [
          ...DUMMY_CATEGORIES
              .map(
                (item) => CategoryItem(
                  color: item.color,
                  title: item.title,
                  id: item.id,
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
