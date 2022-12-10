import 'package:flutter/material.dart';
import 'package:recipe_app/screens/categories_screen.dart';
import 'package:recipe_app/screens/category_meals_screen.dart';
import 'package:recipe_app/screens/filters_screen.dart';
import 'package:recipe_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(
      {required VoidCallback function,
      required String title,
      required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            color: Theme.of(context).secondaryHeaderColor,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile(
            function: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const TabsScreen(),
                ),
              );
            },
            title: 'Meals',
            icon: Icons.restaurant,
          ),
          buildListTile(
            function: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const FiltersScreen(),
                ),
              );
            },
            title: 'Filters',
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
