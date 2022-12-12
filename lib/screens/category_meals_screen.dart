import 'package:flutter/material.dart';
import 'package:recipe_app/dummy_data.dart';
import 'package:recipe_app/screens/filters_screen.dart';
import 'package:recipe_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;
  const CategoryMealsScreen(
      {super.key, required this.categoryTitle, required this.categoryId});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayedMeals = [];
  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void initState() {
    displayedMeals = availableMeals
        .where((element) => element.categories.contains(widget.categoryId))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
           
          );
        },
      ),
    );
  }
}
