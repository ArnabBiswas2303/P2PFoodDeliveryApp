part of 'orders_bloc.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {
  final int cartCount;

  OrdersInitial(this.cartCount);
}

class OrderAdded extends OrdersState {
  final int cartCount;

  OrderAdded(this.cartCount);
}

class OrderList extends OrdersState {
  final Map<String, Order> orderList;

  OrderList(this.orderList);
}

class OrderIncreased extends OrdersState {
  final Order f;

  OrderIncreased(this.f);
}

class OrderDecreased extends OrdersState {
  final Order f;

  OrderDecreased(this.f);
}

class OrderLoading extends OrdersState {}

class OrderSent extends OrdersState {}
