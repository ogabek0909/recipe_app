import 'package:flutter/material.dart';
import 'package:recipe_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItem(
      {super.key, required this.color, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategoryMealsScreen(categoryId: id, categoryTitle: title),
          ),          
        );
        
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Text(title),
      ),
    );
  }
}
