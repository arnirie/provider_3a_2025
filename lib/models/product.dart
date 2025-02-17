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

  void toggleFavorite(Product p) {
    p.isFav = !p.isFav;
    notifyListeners();
  }

  void toggleFav(int id) {
    //search
    var product = _products.firstWhere((item) => item.id == id);
    product.isFav = !product.isFav;
    notifyListeners();
  }
}

class Product {
  final int id;
  late String name;
  late String description;
  late double price;
  late bool isFav;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.isFav = false,
  });
}
