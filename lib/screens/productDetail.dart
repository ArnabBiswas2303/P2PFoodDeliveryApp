import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p/bloc/orders_bloc.dart';
import 'package:p2p/models/foodItem.dart';

class ProductDetail extends StatefulWidget {
  final FoodItem foodItem;
  ProductDetail(this.foodItem);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final handler = BlocProvider.of<OrdersBloc>(context);
    int cartItemsNo = handler.getOrders.getCartCount;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: 20, bottom: 100),
            children: <Widget>[
              CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
                imageUrl: widget.foodItem.fImg,
              ),
              SizedBox(height: 20),
              namePrice(
                context,
                widget.foodItem.fName,
                widget.foodItem.price.toString(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.foodItem.pName,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.foodItem.fDes,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              backAndCart(context, handler, cartItemsNo),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        onPressed: () {
                          handler.add(AddFoodToCart(widget.foodItem));
                        },
                        child: Text(
                          "Add to Cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: EdgeInsets.all(10),
                        onPressed: () {},
                        child: Text(
                          "Favourite Chef",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

backAndCart(BuildContext context, final handler, int cartCount) {
  return Container(
    padding: EdgeInsets.only(top: 30, left: 10, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(EvaIcons.arrowBackOutline),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 30,
        ),
        BlocBuilder<OrdersBloc, OrdersState>(
          bloc: handler,
          builder: (context, state) {
            if (state is OrderAdded) return buildCartButton(state.cartCount);
            return buildCartButton(cartCount);
          },
        )
      ],
    ),
  );
}

Badge buildCartButton(int cartCount) {
  return Badge(
    position: BadgePosition.topRight(top: 0, right: 4),
    badgeColor: Colors.blue,
    borderRadius: 30,
    animationType: BadgeAnimationType.fade,
    badgeContent: Text(
      cartCount.toString(),
      style: TextStyle(color: Colors.white),
    ),
    child: IconButton(
      icon: Icon(EvaIcons.shoppingCartOutline),
      color: Colors.white,
      onPressed: () {},
      iconSize: 30,
    ),
  );
}

namePrice(BuildContext context, String name, String price) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          name.length > 25 ? name.substring(0, 20) + "...." : name,
          softWrap: true,
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "\$ $price",
          softWrap: true,
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        )
      ],
    ),
  );
}
