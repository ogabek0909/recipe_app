import 'package:flutter/material.dart';
import 'package:recipe_app/screens/tabs_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: const TabsScreen(),
      theme: ThemeData(
          primarySwatch: Colors.pink,
          // accentColor: Colors.amber,
          canvasColor:const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().primaryTextTheme.copyWith(
                bodyMedium:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyLarge:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleLarge: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
                titleMedium: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
                titleSmall: const TextStyle(
                  fontSize: 15,
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
