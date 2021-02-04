import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color bgcolor;
  final String id;
  CategoryItem({this.title, this.bgcolor, this.id});

  void onTapTheInkWellCategoryItem(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapTheInkWellCategoryItem(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'IBMPlexSans',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              bgcolor.withOpacity(0.7),
              bgcolor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
