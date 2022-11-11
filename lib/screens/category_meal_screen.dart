import 'package:flutter/material.dart';
import 'package:foodies/dummy_data.dart';
import 'package:foodies/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const categoryMealScreen = 'categoryMealScreen';

  const CategoryMealScreen({Key? key}) : super(key: key);
  // final String? id;
  // final String? title;
  //
  // const CategoryMealScreen({Key? key, required this.title, required this.id})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            imageUrl: categoryMeal[index].imageUrl,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
