import "package:flutter/material.dart";

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String title;

  const CategoryMealsScreen({
    Key key,
    this.title,
    this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          "Catergory Meals Screen",
        ),
      ),
    );
  }
}
