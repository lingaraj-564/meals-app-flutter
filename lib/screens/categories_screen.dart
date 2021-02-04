import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../data/dummy_dart.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // GridView is for designing the look of our grid
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((categorydata) => CategoryItem(
                id: categorydata.id,
                bgcolor: categorydata.bgcolor,
                title: categorydata.title,
              ))
          .toList(),

      //in the main screen we  want a grid
      //view next to each other
      //'now silver in flutter are really just a scrollable areas
      //on the screen Grid is just like a  listview is scrollable
      //as a default.'
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      //'SliverGridDelegateWithMaxCrossAxisExtent' = this is a preconfigured
      //class which allow  us to define a maximum width for each
      //grid item and then it will create as many column as we can fit items
      //with that provide width next  to  each other
    );
  }
}
