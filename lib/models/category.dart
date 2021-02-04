// tis is not a widget this is a normal class
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  // color is not a property that build in dart
  // color is available(provided by) in flutter
  // so we have to import material.dart
  final Color bgcolor;
  //**we have to put a const constructor here because  
  // all these properties are final .
  //**the properties of an object can't be changed after the 
  //obj has been created 
  //**so we have a list of values that will never change after we create that 
 const Category({
    //each category have an id
    //required is available in material.dart
    @required this.id,
    //name of the  category like asian ,italian
    @required this.title,
    //each category should have a background color
    this.bgcolor = Colors.teal,
  });
}
