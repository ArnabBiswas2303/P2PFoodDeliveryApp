import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Favourites extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    barkolor();
    return Scaffold(
        appBar: headerGeneral("Favourites"),
        drawer: drawerNav(context),
        body: ListView(
          children: <Widget>[],
        ));
  }
}
