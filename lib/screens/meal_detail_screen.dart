import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  MealDetailScreen({Key? key}) : super(key: key);
  static const mealDetailScreen = 'mealDetailScreen';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(mealId),
        ),
        body: Center(
          child: Text('Meal Screen $mealId'),
        ),
      ),
    );
  }
}
