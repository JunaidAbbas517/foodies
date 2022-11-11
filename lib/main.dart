import 'package:flutter/material.dart';
import 'package:foodies/screens/categories_screen.dart';
import 'package:foodies/screens/category_meal_screen.dart';
import 'package:foodies/screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodies',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //   secondary: Colors.amber,
        // Your accent color
        // ),
        // canvasColor: const Color.fromRGBO(255, 254, 259, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w900,
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CategoriesScreen(),
        CategoryMealScreen.categoryMealScreen: (context) =>
            CategoryMealScreen(),
        MealDetailScreen.mealDetailScreen: (context) => MealDetailScreen(),
      },
    );
  }
}
