// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:p2p/bloc/orders_bloc.dart';
// import 'package:p2p/models/order.dart';
// import 'package:p2p/utils/utils.dart';
// import 'package:p2p/widgets/drawerNavWidget.dart';
// import 'package:p2p/widgets/headerGeneral.dart';

// class Cart extends StatefulWidget {
//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Cart> {
//   @override
//   Widget build(BuildContext context) {
//     final handler = BlocProvider.of<OrdersBloc>(context);
//     handler.add(GetOrderList());
//     var orderList;
//     barkolor();
//     return Scaffold(
//       backgroundColor: kolor("F0F1F0"),
//       appBar: headerGeneral("Cart"),
//       drawer: drawerNav(context),
//       body: Stack(
//         children: <Widget>[
//           BlocBuilder<OrdersBloc, OrdersState>(
//             bloc: handler,
//             builder: (context, state) {
//               if (state is OrderList) {
//                 orderList = state.orderList;
//                 return buildListView(context, state.orderList, handler);
//               }
//               return buildListView(context, orderList, handler);
//             },
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               SizedBox(),
//               Container(
//                 color: Colors.white,
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(height: 20),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 30),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text(
//                             "TOTAL",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                                 color: thatBlueColor()),
//                             softWrap: true,
//                           ),
//                           buildTotalText(),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 30, right: 30, top: 20, bottom: 20),
//                       child: FlatButton(
//                         padding: EdgeInsets.all(16),
//                         color: Colors.green,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50)),
//                         onPressed: () {},
//                         child: Center(
//                           child: Text(
//                             "Checkout",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Text buildTotalText() {
//     return Text(
//       "\$ 1267",
//       style: TextStyle(
//           fontSize: 25, fontWeight: FontWeight.bold, color: thatBlueColor()),
//       softWrap: true,
//     );
//   }

//   Widget buildListView(BuildContext context, final cartList, final handler) {
//     List listItems = [];
//     cartList.forEach(
//       (k, v) => listItems.add(
//         itemCard(context, v, handler, k),
//       ),
//     );
//     if (listItems.isEmpty) return buildNothingToShow();
//     return ListView(
//       padding: EdgeInsets.only(top: 10, bottom: 300, left: 10, right: 10),
//       children: <Widget>[...listItems],
//     );
//   }
// }

// Center buildNothingToShow() {
//   return Center(
//     child: Text("Nothing in your cart yet!"),
//   );
// }

// Container itemCard(
//     BuildContext context, Order f, final handler, final String k) {
//   return Container(
//     key: Key(k),
//     margin: EdgeInsets.only(bottom: 10),
//     padding: EdgeInsets.all(5),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: BlocBuilder<OrdersBloc, OrdersState>(
//       bloc: handler,
//       builder: (_, state) {
//         if (state is OrderIncreased)
//           return cartItemRow(f, context, handler, k);
//         else if (state is OrderDecreased)
//           return cartItemRow(f, context, handler, k);
//         return cartItemRow(f, context, handler, k);
//       },
//     ),
//   );
// }

// Row cartItemRow(Order f, BuildContext context, handler, String k) {
//   print("ROW");
//   return Row(
//     children: <Widget>[
//       ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: CachedNetworkImage(
//           imageUrl: f.foodItem.fImg,
//           width: MediaQuery.of(context).size.width * 0.3,
//           height: MediaQuery.of(context).size.width * 0.25,
//           fit: BoxFit.cover,
//         ),
//       ),
//       SizedBox(width: 10),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             f.foodItem.fName,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             softWrap: true,
//           ),
//           SizedBox(height: 10),
//           Row(
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.black.withOpacity(0.05)),
//                 child: Row(
//                   children: <Widget>[
//                     IconButton(
//                         icon: Icon(
//                           EvaIcons.arrowCircleDownOutline,
//                           color: Colors.red,
//                         ),
//                         onPressed: () {
//                           handler.add(DecreaseFoodQuantity(k));
//                         }),
//                     SizedBox(width: 10),
//                     quntityText(f),
//                     SizedBox(width: 10),
//                     IconButton(
//                       icon: Icon(
//                         EvaIcons.arrowCircleUpOutline,
//                         color: Colors.green,
//                       ),
//                       onPressed: () {
//                         handler.add(IncreseFoodQuantity(k));
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(width: 10),
//               Text(
//                 "\$ ${f.foodItem.price * f.quantity}",
//                 style: TextStyle(fontSize: 20),
//               ),
//             ],
//           )
//         ],
//       )
//     ],
//   );
// }

// Text quntityText(Order f) {
//   return Text(
//     "x ${f.quantity}",
//     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//   );
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p/bloc/orders_bloc.dart';
import 'package:p2p/models/order.dart';
import 'package:p2p/utils/utils.dart';
import 'package:p2p/widgets/drawerNavWidget.dart';
import 'package:p2p/widgets/headerGeneral.dart';

class Cart extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Cart> {
  itemCard(Order order, String key) {
    final handler = BlocProvider.of<OrdersBloc>(context);
    return Container(
      key: Key(key),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: order.foodItem.fImg,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                order.foodItem.fName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                softWrap: true,
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.05)),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            EvaIcons.arrowCircleDownOutline,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            handler.add(DecreaseFoodQuantity(key));
                          },
                        ),
                        SizedBox(width: 10),
                        Text(
                          "x ${order.quantity}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            EvaIcons.arrowCircleUpOutline,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            handler.add(IncreseFoodQuantity(key));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "\$ ${order.foodItem.price * order.quantity}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    barkolor();
    final handler = BlocProvider.of<OrdersBloc>(context);
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return buildLoadingScaffold(context);
        } else if (state is OrderSent) {
          return buildCenterText(context, "Order Completed!!!");
        }
        return buildCartScaffold(context, state, handler);
      },
    );
  }

  Scaffold buildCartScaffold(BuildContext context, state, final handler) {
    final _cartList = handler.getOrders.getCartItem;
    if (_cartList.isEmpty) return buildCenterText(context, "Nothing To Show!");
    var _cart = [];
    double total = 0;
    _cartList.forEach(
      (k, v) {
        total += v.quantity * v.foodItem.price;
        _cart.add(itemCard(v, k));
      },
    );
    return Scaffold(
      backgroundColor: kolor("F0F1F0"),
      appBar: headerGeneral("Cart"),
      drawer: drawerNav(context),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: 10, bottom: 300, left: 10, right: 10),
            children: <Widget>[..._cart],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "TOTAL",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: thatBlueColor()),
                            softWrap: true,
                          ),
                          Text(
                            "\$ $total",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: thatBlueColor()),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      child: FlatButton(
                        padding: EdgeInsets.all(16),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () {
                          handler.add(CheckoutCart());
                        },
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Scaffold buildCenterText(BuildContext context, String text) {
    return Scaffold(
      backgroundColor: kolor("F0F1F0"),
      appBar: headerGeneral("Cart"),
      drawer: drawerNav(context),
      body: Center(
        child: Text(text),
      ),
    );
  }
}

Scaffold buildLoadingScaffold(BuildContext context) {
  return Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
