import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/ordersRepo.dart';
import '../models/order.dart';
import '../models/foodItem.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersRepo ordersRepo;
  OrdersBloc(this.ordersRepo);

  OrdersRepo get getOrders {
    return ordersRepo;
  }

  @override
  OrdersState get initialState => OrdersInitial(ordersRepo.getCartCount);

  @override
  Stream<OrdersState> mapEventToState(
    OrdersEvent event,
  ) async* {
    if (event is AddFoodToCart) {
      int cartCount = ordersRepo.addToCart(event.f);
      yield OrderAdded(cartCount);
    } else if (event is IncreseFoodQuantity) {
      yield OrderIncreased(ordersRepo.increaseQuantity(event.id));
    } else if (event is DecreaseFoodQuantity) {
      yield OrderDecreased(ordersRepo.decreaseQuantity(event.id));
    } else if (event is CheckoutCart) {
      yield OrderLoading();
      await ordersRepo.checkOut();
      yield OrderSent();
      ordersRepo.clearCart();
      await ordersRepo.checkOut();
      yield OrdersInitial(ordersRepo.getCartCount);
    } else if (event is GetOrderList) {
      yield OrderList(ordersRepo.getCartItem);
    }
  }
}
