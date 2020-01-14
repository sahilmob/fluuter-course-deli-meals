import "package:flutter/material.dart";
import "package:deli_meals/dummy_data.dart";

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";
  // final String categoryId;
  // final String title;

  // const CategoryMealsScreen({
  //   Key key,
  //   this.title,
  //   this.categoryId,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs["id"];
    final categoryTitle = routeArgs["title"];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return Text(categoryMeals[i].title);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
