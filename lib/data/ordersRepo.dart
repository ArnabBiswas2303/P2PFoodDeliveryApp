import '../models/foodItem.dart';
import '../models/order.dart';
import 'dart:math';

class OrdersRepo {
  Map<String, Order> _cart = {};

  int addToCart(FoodItem f) {
    var o = Order(foodItem: f, quantity: 1);
    _cart[f.fId] = o;
    return _cart.length;
  }

  int get getCartCount {
    return _cart.length;
  }

  Map<String, Order> get getCartItem {
    return {..._cart};
  }

  void removeFromCart(String id) {
    _cart.remove(id);
  }

  void clearCart() {
    _cart = {};
  }

  Order increaseQuantity(String id) {
    _cart[id].quantity += 1;
    return _cart[id];
  }

  Order decreaseQuantity(String id) {
    _cart[id].quantity -= 1;
    if (_cart[id].quantity == 0) removeFromCart(id);
    return _cart[id];
  }

  Future<bool> checkOut() {
    return Future.delayed(
      Duration(seconds: 5),
      () {
        final random = Random();
        // if (random.nextBool()) {
        //   throw NetworkError();
        // }
        return true;
      },
    );
  }
}

class NetworkError extends Error {}
