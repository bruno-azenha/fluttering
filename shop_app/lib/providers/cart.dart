import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final int priceInCents;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.priceInCents,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int get totalAmountInCents {
    return _items.entries.fold(0,
        (acc, entry) => acc + entry.value.priceInCents * entry.value.quantity);
  }

  void addItem(
    String productId,
    int priceInCents,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                priceInCents: existingCartItem.priceInCents,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            priceInCents: priceInCents,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
