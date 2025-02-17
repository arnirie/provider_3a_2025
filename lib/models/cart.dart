import 'package:flutter/material.dart';
import 'package:provider_state_management/models/product.dart';

class Cart extends ChangeNotifier {
  final List<CartItem> _cart = [
    //prod1-2
    //prod2-1
  ];
  // int counter = 0;

  List<CartItem> get items => _cart;

  int get count {
    return _cart.length;
  }

  int get countTotal {
    int c = 0;
    _cart.forEach((item) => c += item.count);
    return c;
  }

  void add(CartItem item) {
    _cart.add(item);
    // counter += item.count;
    notifyListeners();
  }
}

class CartItem {
  final Product product;
  late int count;

  CartItem({
    required this.product,
    this.count = 1,
  });
}
