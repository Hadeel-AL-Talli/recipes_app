import 'package:flutter/material.dart';
import 'package:meal_app_udemycourse/models/meal.dart';
import 'package:meal_app_udemycourse/widgets/meal_item.dart';

class FavoirateScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoirateScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("You hava no Favorites yet -start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            imageUrl: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
