import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p/bloc/consumer_bloc_bloc.dart';
import 'package:p2p/screens/account.dart';
import 'package:p2p/screens/cart.dart';
import 'package:p2p/screens/favourites.dart';
import 'package:p2p/screens/home.dart';
import 'package:p2p/screens/orders.dart';
import 'package:p2p/screens/productDetail.dart';
import 'package:p2p/utils/utils.dart';

navRowsText(x) {
  return ListTile(
    leading: Text(
      x,
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
          color: thatBlueColor(), fontSize: 18, fontWeight: FontWeight.w300),
    ),
  );
}

navRows(x, y, context) {
  StatefulWidget st;
  switch (y) {
    case "Home":
      st = Home();
      break;
    case "Favourites":
      st = Favourites();
      break;
    case "Orders":
      st = Cart();
      break;
    case "Account":
      st = Account();
      break;
  }
  return ListTile(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return st;
      }));
    },
    leading: Icon(
      x,
      color: thatBlueColor(),
      size: 25,
    ),
    title: Text(
      y,
      softWrap: true,
      style: TextStyle(
          color: thatBlueColor(), fontSize: 18, fontWeight: FontWeight.w300),
    ),
  );
}

// App Drawer (Side)
drawerNav(BuildContext context) {
  final b = BlocProvider.of<ConsumerBlocBloc>(context).consumerRepo.consumer;
  return SizedBox(
    child: Drawer(
      child: Container(
        color: kolor("#F0F1F0"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                  child: Center(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: CachedNetworkImageProvider(b.cImg),
                    ), // This is where the Profile image comes in !
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  b.cName,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      color: thatBlueColor(),
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                // Following Rows Display Text and Column
                navRows(EvaIcons.homeOutline, "Home", context),
                navRows(EvaIcons.heartOutline, "Favourites", context),
                navRows(EvaIcons.bellOffOutline, "Orders", context),
                navRows(EvaIcons.personOutline, "Account", context),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Divider(thickness: 1),
                ),
                GestureDetector(
                  child: navRowsText("SETTINGS"),
                  onTap: () {},
                ),
                GestureDetector(
                  child: navRowsText("CONTACT US"),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    ),
    width: MediaQuery.of(context).size.width * 0.65,
    // using a sizedbox to limit width of Drawer
  );
}
