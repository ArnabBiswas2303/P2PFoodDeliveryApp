import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> categories = [
    "North Indian",
    "South Indian",
    "Health Plus",
    "Non Vegan",
    "Vegan",
    "Quick Bites"
  ];
  List<String> kolors = colorList();

  searchbar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  hintText: "Search"),
            ),
          ),
          IconButton(
            color: Colors.green,
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }

  // colorCard(){
  //   return COnta
  // }

  grid() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(categories.length, (index) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: kolor(kolors[index]),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              categories[index],
              softWrap: true,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.w900),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    barkolor();
    return Scaffold(
      backgroundColor: kolor("#F0F1F0"),
      drawer: drawerNav(context),
      appBar: headerGeneral("What to eat?"),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: searchbar(),
          ),
          grid(),
        ],
      ),
    );
  }
}
