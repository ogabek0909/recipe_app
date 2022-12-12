import 'package:flutter/material.dart';
import 'package:recipe_app/dummy_data.dart';
import 'package:recipe_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

Map<String, bool> _filters = {
  'gluten': false,
  'lactose': false,
  'vegetarian': false,
  'vegan': false,
};

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = _filters['gluten']!;
  bool _vegetarian = _filters['vegetarian']!;
  bool _vegan = _filters['vegan']!;
  bool _lactoseFree = _filters['lactose']!;

  @override
  Widget build(BuildContext context) {
    void setFilters() {
      Map<String, bool> selected = {
        'gluten': _glutenFree,
        'lactose': _lactoseFree,
        'vegetarian': _vegetarian,
        'vegan': _vegan,
      };
      setState(() {
        _filters = selected;
        availableMeals = DUMMY_MEALS.where((element) {
          if (_filters['gluten']! && !element.isGlutenFree) {
            return false;
          }
          if (_filters['lactose']! && !element.isLactoseFree) {
            return false;
          }
          if (_filters['vegetarian']! && !element.isVegetarian) {
            return false;
          }
          if (_filters['vegan']! && !element.isVegan) {
            return false;
          }
          return true;
        }).toList();
      });
    }

    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(onPressed: setFilters, icon: const Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(children: [
                _buildSwitchListTile(
                  title: 'Gluten-free',
                  description: 'Only include gluten-free meals.',
                  currentValue: _glutenFree,
                  updateValue: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Lactose-free',
                  description: 'Only include lactose-free meals.',
                  currentValue: _lactoseFree,
                  updateValue: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegetarian',
                  description: 'Only include vegetarian meals.',
                  currentValue: _vegetarian,
                  updateValue: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegan',
                  description: 'Only include vegan meals.',
                  currentValue: _vegan,
                  updateValue: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                )
              ]),
            )
          ],
        ));
  }

  SwitchListTile _buildSwitchListTile({
    required String title,
    required String description,
    required bool currentValue,
    required Function updateValue,
  }) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(
          description,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
            fontWeight: FontWeight.normal,
          ),
        ),
        value: currentValue,
        onChanged: (value) => updateValue(value));
  }
}
