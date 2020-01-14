import "package:flutter/material.dart";

class CategoryMealsScreen extends StatelessWidget {
  final String title;

  const CategoryMealsScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The recipes"),
      ),
      body: Center(
        child: Text(
          "Catergory Meals Screen",
        ),
      ),
    );
  }
}
