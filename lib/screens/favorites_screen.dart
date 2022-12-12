import 'package:flutter/material.dart';
import 'package:recipe_app/dummy_data.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return favoriteMeals.isEmpty? const Center(
      child: Text('You have no favorites yet - start adding some!'),
    ): 
    ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
            imageUrl: favoriteMeals[index].imageUrl,
           
          );
        },
      );
  }
}