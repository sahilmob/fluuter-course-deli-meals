import 'package:deli_meals/dummy_data.dart';
import 'package:deli_meals/models/meal.dart';
import "package:flutter/material.dart";

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal"),
      ),
      body: Center(
        child: Text(meal.title),
      ),
    );
  }
}
