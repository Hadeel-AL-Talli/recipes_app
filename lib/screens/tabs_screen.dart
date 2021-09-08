import 'package:flutter/material.dart';
import 'package:meal_app_udemycourse/models/meal.dart';
import 'package:meal_app_udemycourse/screens/category_screen.dart';
import 'package:meal_app_udemycourse/screens/favioratescreen.dart';
import 'package:meal_app_udemycourse/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategotyScreen(), 'title': 'Categories'},
      {
        'page': FavoirateScreen(widget.favoriteMeals),
        'title': 'Your Favorites'
      },
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("Categories")),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text("Favorites")),
          ]),
      drawer: MainDrawer(),
    );
  }
}
