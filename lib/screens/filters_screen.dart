import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String id = '/FiltersScreen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    //When the page initializes, it changes the values to the passed values from main.dart
    // This way, some from of persistence is acheived 
    _isGlutenFree = widget.currentFilters['gluten'];
    _isLactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Filter Meals',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  //Remember to change to builder method
                  SwitchListTile.adaptive(
                    value: _isGlutenFree,
                    onChanged: (value) => setState(() => _isGlutenFree = value),
                    title: Text('Is Gluten-Free'),
                    subtitle: Text('Only include Gluten-Free meals'),
                  ),
                  SwitchListTile.adaptive(
                    value: _isLactoseFree,
                    onChanged: (value) =>
                        setState(() => _isLactoseFree = value),
                    title: Text('Is Lactose-Free'),
                    subtitle: Text('Only include Lactose-Free meals'),
                  ),
                  SwitchListTile.adaptive(
                    value: _isVegan,
                    onChanged: (value) => setState(() => _isVegan = value),
                    title: Text('Is Vegan'),
                    subtitle: Text('Only include Vegan meals'),
                  ),
                  SwitchListTile.adaptive(
                    value: _isVegetarian,
                    onChanged: (value) => setState(() => _isVegetarian = value),
                    title: Text('Is Vegeterian'),
                    subtitle: Text('Only include Vegeterian meals'),
                  )
                ],
              ),
            ),
            FlatButton.icon(
                onPressed: () {
                  /*Accesses values from the switch tiles and stores them into a map which is thereafter sent as filterlist, 
                  Then, replaces page with homepage*/
                  Map<String, bool> selectedFilters = {
                    'gluten': _isGlutenFree,
                    'lactose': _isLactoseFree,
                    'vegan': _isVegan,
                    'vegetarian': _isVegetarian
                  };
                  widget.saveFilters(selectedFilters);
                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: Icon(Icons.save),
                label: Text('Save Settings'))
          ],
        ));
  }
}
