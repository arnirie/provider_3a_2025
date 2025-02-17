import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/models/cart.dart';
import 'package:provider_state_management/models/product.dart';
import 'package:provider_state_management/screens/product_listing.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(create: (context) => Products()),
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        home: ProductListingScreen(),
      ),
    );
  }
}
