import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';

headerGeneral(x) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    titleSpacing: 0,
    title: Text(
      x,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 25,
        color: kolor("#283060"),
      ),
    ),
    iconTheme: new IconThemeData(
      color:
          thatBlueColor(), // using our primary color, can be found in utils class
    ),
    backgroundColor: Colors.white,
  );
}
