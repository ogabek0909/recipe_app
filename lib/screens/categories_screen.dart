import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/category_item.dart';
import 'package:recipe_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((e) => CategoryItem(
                color: e.color,
                title: e.title,
                id: e.id,
              ))
          .toList(),
    );
  }
}
