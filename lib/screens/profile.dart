import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Profile extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Profile> {
  TextEditingController tcName, tcGender, tcMobile, tcEmail;

  fieldRows(x, controllerX) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
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
            labelText: x,
            hasFloatingPlaceholder: true,
            hintStyle: TextStyle(fontSize: 20),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ),
      ),
    );
  }

  updateButton() {
    return FlatButton(
      padding: EdgeInsets.all(16),
      color: Colors.pink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () {},
      child: Center(
        child: Text(
          "Update",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    barkolor();
    return Scaffold(
      backgroundColor: kolor("#F0F1F0"),
      appBar: headerGeneral("Profile"),
      drawer: drawerNav(context),
      body: ListView(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
        children: <Widget>[
          Container(
            child: Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage: CachedNetworkImageProvider(
                    "https://avatars0.githubusercontent.com/u/44332739?s=400&u=6548a3e31dda13a8d0601e67e1f2a837b04db5e1&v=4"),
              ), // This is where the Profile image comes in !
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Yasser Arafat",
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
                color: thatBlueColor(),
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          fieldRows(
            "Name",
            tcName,
          ),
          SizedBox(height: 16),
          fieldRows(
            "Gender",
            tcGender,
          ),
          SizedBox(height: 16),
          fieldRows(
            "Mobile",
            tcMobile,
          ),
          SizedBox(height: 16),
          fieldRows(
            "Email",
            tcEmail,
          ),
          SizedBox(height: 16),
          updateButton(),
        ],
      ),
    );
  }
}
