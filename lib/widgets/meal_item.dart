import 'package:flutter/material.dart';
import 'package:foodies/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String? id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability})
      : super(key: key);
  String? get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'simple';
      case Complexity.hard:
        return 'hard';
      case Complexity.challenging:
        return 'challenging';
      default:
        return 'Unknown';
    }
  }

  String? get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'affordable';
      case Affordability.pricey:
        return 'pricey';
      case Affordability.luxurious:
        return 'luxurious';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetailScreen.mealDetailScreen,
        arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () => selectMeal(context),
          child: Card(
            elevation: 4,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                      ),
                      child: Image.network(
                        imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 10.0,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        width: 220,
                        decoration: BoxDecoration(color: Colors.black54),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        const Icon(
                          Icons.schedule,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '$duration mins',
                        ),
                      ]),
                      Row(
                        children: [
                          const Icon(
                            Icons.work,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            '$complexityText',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            '$affordabilityText',
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
