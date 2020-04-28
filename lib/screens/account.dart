import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p2p/bloc/consumer_bloc_bloc.dart';
import 'package:p2p/screens/address.dart';
import 'package:p2p/screens/cart.dart';
import 'package:p2p/screens/favourites.dart';
import 'package:p2p/screens/orders.dart';
import 'package:p2p/screens/productDetail.dart';
import 'package:p2p/screens/profile.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Account extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Account> {
  navRows(x, y, context) {
    StatefulWidget st;
    switch (y) {
      case "Favourites":
        st = Favourites();
        break;
      case "Orders":
        st = Orders();
        break;
      case "Cart":
        st = Cart();
        break;
      case "Profile Details":
        st = Profile();
        break;
      case "Address":
        st = Address();
        break;
      // case "Payment":
      // st = ProductDetail();
      //   break;
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
          color: thatBlueColor(),
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

// "https://avatars0.githubusercontent.com/u/44332739?s=400&u=6548a3e31dda13a8d0601e67e1f2a837b04db5e1&v=4"
  @override
  Widget build(BuildContext context) {
    final b = BlocProvider.of<ConsumerBlocBloc>(context).consumerRepo.consumer;
    barkolor();
    return Scaffold(
      backgroundColor: kolor("#F0F1F0"),
      appBar: headerGeneral("Account"),
      drawer: drawerNav(context),
      body: ListView(
        padding: EdgeInsets.only(top: 20, bottom: 100),
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: CachedNetworkImageProvider(b.cImg),
                  ), // This is where the Profile image comes in !
                ),
              ),
              SizedBox(height: 10),
              Text(b.cName,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      color: thatBlueColor(),
                      fontSize: 25,
                      fontWeight: FontWeight.w500))
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              children: <Widget>[
                navRows(EvaIcons.heartOutline, "Favourites", context),
                navRows(EvaIcons.bellOutline, "Orders", context),
                navRows(EvaIcons.shoppingCartOutline, "Cart", context),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: <Widget>[
                navRows(EvaIcons.personAddOutline, "Profile Details", context),
                navRows(EvaIcons.pinOutline, "Address", context),
                navRows(EvaIcons.npmOutline, "Payment", context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
