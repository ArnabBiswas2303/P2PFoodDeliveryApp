part of 'orders_bloc.dart';

@immutable
abstract class OrdersEvent {}

class GetOrderList extends OrdersEvent {}

class AddFoodToCart extends OrdersEvent {
  final FoodItem f;

  AddFoodToCart(this.f);
}

class IncreseFoodQuantity extends OrdersEvent {
  final String id;

  IncreseFoodQuantity(this.id);
}

class DecreaseFoodQuantity extends OrdersEvent {
  final String id;

  DecreaseFoodQuantity(this.id);
}

class CheckoutCart extends OrdersEvent {}
