import 'package:flutter/material.dart';
import 'package:meal_app_udemycourse/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
 
  
  @override
   initState() { 
      _glutenFree = widget.currentFilters['gluten'];
      _lactoseFree = widget.currentFilters['lectose'];
       _vegan = widget.currentFilters['vegan'];
       _vegetarian = widget.currentFilters['vegetarian'];
     
    super.initState();
    
  }

  Widget buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'lectose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection ",
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchTile(
                'Gluten Free',
                'Only include gluten-free meals',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              buildSwitchTile(
                'Lactose Free',
                'Only include Lactose Free meals',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              buildSwitchTile(
                'Vegetarian ',
                'Only include vegetarian meals',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              buildSwitchTile(
                'Vegan ',
                'Only include vegan meals',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
