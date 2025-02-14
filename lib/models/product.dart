import 'package:flutter/material.dart';

class Products extends ChangeNotifier {
  final List<Product> _products = [
    Product(id: 1, name: 'koppel', description: 'aircon', price: 20000),
  ];

  List<Product> get items => _products;

  int get count {
    return _products.length;
  }

  void add(Product p) {
    _products.add(p);
    notifyListeners(); //all ui depending on this should update
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });
}
