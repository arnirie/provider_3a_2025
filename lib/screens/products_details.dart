import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/models/product.dart';

class ProductsDetailsScreen extends StatelessWidget {
  ProductsDetailsScreen({super.key, required this.prodIndex});

  // final Product product;
  final int prodIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(
      builder: (context, products, child) {
        var product = products.items[prodIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(product.name),
            actions: [
              IconButton(
                  onPressed: () {
                    Provider.of<Products>(context, listen: false)
                        .toggleFavorite(product);
                    // Navigator.of(context).pop();
                  },
                  icon: Icon(
                      product.isFav ? Icons.favorite : Icons.favorite_outline))
            ],
          ),
          body: Text(product.description),
        );
      },
    );
  }
}
