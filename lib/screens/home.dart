import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p/bloc/food_bloc.dart';
import 'package:p2p/screens/productDetail.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final handler = BlocProvider.of<FoodBloc>(context);
    handler.add(GetFood());
    barkolor(); // Barkolor can be found in Utils Class , it makes color of status bar White
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodInitial)
          return buildLoadingScaffold(context);
        else if (state is FoodLoaded) return buildScaffold(context, state);
        return Text("Something Went Wrong");
      },
    );
  }

  Scaffold buildScaffold(BuildContext context, FoodLoaded state) {
    return Scaffold(
      drawer: drawerNav(context), // navigation Drawer Widget in Widgets Library
      appBar: homeAppBar(context),
      body: ListView(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Text(state.foodList[0].fName),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetail(state.foodList[0]);
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Text(state.foodList[1].fName),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetail(state.foodList[1]);
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Text(state.foodList[2].fName),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetail(state.foodList[2]);
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

Scaffold buildLoadingScaffold(BuildContext context) {
  return Scaffold(
    appBar: homeAppBar(context),
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
