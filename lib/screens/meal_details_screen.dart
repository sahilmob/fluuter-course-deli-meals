import 'package:deli_meals/dummy_data.dart';
import 'package:deli_meals/models/meal.dart';
import "package:flutter/material.dart";

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(
              context,
              "Ingredients",
            ),
            buildContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      meal.ingredients[index],
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(
                      meal.steps[index],
                    ),
                  ),
                  Divider()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
