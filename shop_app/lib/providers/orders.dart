import 'package:flutter/foundation.dart';

import './cart.dart';

class OrderItem {
  final String id;
  final int amountInCents;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amountInCents,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, int totalInCents) {
    _orders.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          amountInCents: totalInCents,
          products: cartProducts,
          dateTime: DateTime.now(),
        ));
    notifyListeners();
  }
}
