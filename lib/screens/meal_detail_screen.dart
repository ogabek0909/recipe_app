import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  final String id;
  const MealDetailScreen({super.key, required this.id});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionContainer(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            buildSectionContainer(context, 'Steps'),
            buildContainer(ListView.separated(
              itemCount: selectedMeal.steps.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      child: Text(
                    "# ${index + 1}",
                  )),
                  title: Text(
                    selectedMeal.steps[index],
                    style: const TextStyle(color: Colors.black87),
                  ),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final existingIndex =
              favoriteMeals.indexWhere((element) => element.id == widget.id);
          if (existingIndex >= 0) {
            setState(() {
              favoriteMeals.removeAt(existingIndex);
            });
          } else {
            setState(() {
              favoriteMeals.add(
                  DUMMY_MEALS.firstWhere((element) => element.id == widget.id));
            });
          }
          
        },
        child: favoriteMeals.any((element) => element.id == widget.id)
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      ),
    );
  }

  Container buildContainer(Widget child) {
    return Container(
        height: 150,
        width: 300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }

  Container buildSectionContainer(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
