import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';
import 'package:p2p/widgets/loading.dart';

class Address extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Address> {
  TextEditingController addressName, address;
  bool showDialog = false;
  List<List<String>> addresses = [
    [
      "Address Name 1",
      "36B Stillwater St.Hopkinsville, KY 42240, KY 42240, KY 42240"
    ],
    ["Address Name 2", "457 Newcastle Ave.Monroe, NY 10950, NY 10950, NY 10950"]
  ];

  nameRows(x, controllerX) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: TextField(
          style: TextStyle(fontSize: 20),
          controller: controllerX,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            hintText: x,
            hintStyle: TextStyle(fontSize: 20),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ),
      ),
    );
  }

  dialogView(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                nameRows("Address Name", addressName),
                nameRows("Address", address),
                Container(
                  child: submitButton(),
                  width: MediaQuery.of(context).size.width * 0.4,
                )
              ],
            )),
      ),
    );
  }

  submitButton() {
    return FlatButton(
      padding: EdgeInsets.all(16),
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () {
        setState(() {
          showDialog = false;
        });
      },
      child: Center(
        child: Text(
          "Submit",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  addressCard(x, y) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            x,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            y,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: FlatButton(
              padding: EdgeInsets.all(5),
              color: Colors.pink.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {},
              child: Center(
                child: Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    barkolor();
    return Scaffold(
      backgroundColor: kolor("#E2E2E2"),
      appBar: headerGeneral("Address"),
      drawer: drawerNav(context),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 100,
              left: 16,
              right: 16,
            ),
            children: <Widget>[
              addressCard(addresses[0][0], addresses[0][1]),
              addressCard(addresses[1][0], addresses[1][1]),
            ],
          ),
          // loading(context)
          showDialog ? dialogView(context) : Text(""),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.green,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              showDialog = true;
            });
          },
        ),
      ),
    );
  }
}
