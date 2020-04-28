import 'package:flutter/material.dart';
import 'package:p2p/screens/search.dart';
import 'package:p2p/utils/utils.dart';

homeAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    titleSpacing: 0,
    centerTitle: true,
    iconTheme: new IconThemeData(
      color:
          thatBlueColor(), // using our primary color, can be found in utils class
    ),
    backgroundColor: Colors.white,
    title: Text(
      "Ghar se Ghar Tak",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: kolor("#283060"),
      ),
    ),
    actions: <Widget>[
      // Search Icon Navigates to Search Page
      IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Search();
            }));
          }),
    ],
  );
}
