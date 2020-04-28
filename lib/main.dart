import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p/bloc/consumer_bloc_bloc.dart';
import 'package:p2p/bloc/food_bloc.dart';
import 'package:p2p/bloc/orders_bloc.dart';
import 'package:p2p/data/foodListRepo.dart';
import 'package:p2p/data/ordersRepo.dart';
import 'package:p2p/screens/home.dart';
import './data/consumerRepo.dart';
import './models/consumer.dart';
import './models/address.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Consumer c = Consumer(
    cId: "xyz",
    cName: "Yasser Arafat",
    cAddress: Address(
      city: "Kolkata",
      fullAddress: "511 Jalyavu Residency",
      pincode: 700008,
      state: "West Bengal",
    ),
    cBirthDay: DateTime(1999, 3, 23),
    cEmail: "arnab@gmail.com",
    cGender: "Male",
    cPhone: 9800877990,
    cImg:
        "https://avatars0.githubusercontent.com/u/44332739?s=400&u=6548a3e31dda13a8d0601e67e1f2a837b04db5e1&v=4",
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return ConsumerBlocBloc(ConsumerRepo(c));
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FoodBloc>(
            create: (_) => FoodBloc([], FoodListRepo()),
          ),
          BlocProvider<OrdersBloc>(
            create: (_) => OrdersBloc(OrdersRepo()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'varela'),
          home: Home(),
        ),
      ),
    );
  }
}
