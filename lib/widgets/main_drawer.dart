import 'package:flutter/material.dart';
import 'package:meals_app/screens/Filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
    String title,
    IconData icon,
    Function afterTouchingTheListTile,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title == null ? 'null' : title,
        style: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: afterTouchingTheListTile,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Column(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Love to Cook!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(
            color: Colors.black,
            endIndent: 15,
            indent: 15,
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
          SizedBox(
             height:  50
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 
                Text(
                  'Developer -> LINGARAJ E',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ],
            ),
          Divider(),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Queries At -> lingaraj592000@gmail.com',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
