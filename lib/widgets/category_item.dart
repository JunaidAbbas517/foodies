import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color? color;

  const CategoryItem({Key? key, this.id, this.title, this.color})
      : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context)
        .pushNamed(CategoryMealScreen.categoryMealScreen, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color!.withOpacity(0.7),
              color!,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          title!,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
