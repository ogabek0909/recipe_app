import 'package:flutter/material.dart';
import 'package:recipe_app/screens/categories_screen.dart';
import 'package:recipe_app/screens/tabs_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: TabsScreen(),
      theme: ThemeData(
          primarySwatch: Colors.pink,
          // accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().primaryTextTheme.copyWith(
                bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleLarge: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
              )
          //   textTheme: ThemeData.light().textTheme.copyWith(
          //         bodyText1: TextStyle(
          //           color: Color.fromRGBO(20, 51, 51, 1),
          //         ),
          //         bodyText2: TextStyle(
          //           color: Color.fromRGBO(20, 51, 51, 1),
          //         ),
                  // titleLarge: TextStyle(
                  //   fontSize: 20,
                  //   fontFamily: 'RobotoCondensed',
                  //   fontWeight: FontWeight.bold,
                  // ),
          //       ),
          ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Text('This is navigation time'),
    );
  }
}
