import 'package:deli_meals/widgets/main_drawer.dart';
import "package:flutter/material.dart";

class FiltersScreen extends StatefulWidget {
  static const routeName = "filters";
  final Function saveFilters;
  final Map<String, bool> filters;

  const FiltersScreen(
    this.filters,
    this.saveFilters,
  );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluteenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _gluteenFree = widget.filters["gluteen"];
    _lactoseFree = widget.filters["lactose"];
    _vegan = widget.filters["vegan"];
    _vegetarian = widget.filters["vegetarian"];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters({
                "gluteen": _gluteenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  "Gluten-free",
                  "Show gluten-free meals only",
                  _gluteenFree,
                  (newValue) {
                    setState(() {
                      _gluteenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Lactose-free",
                  "Show lactose-free meals only",
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Show vegetarian meals only",
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Show vegan meals only",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
