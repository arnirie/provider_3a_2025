import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/models/cart.dart';
import 'package:provider_state_management/models/product.dart';
import 'package:provider_state_management/screens/products_details.dart';

class ProductListingScreen extends StatelessWidget {
  ProductListingScreen({super.key});

  final nameCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final priceCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var products = Provider.of<Products>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<Cart>(
            builder: (context, cart, _) {
              return Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_checkout),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      // color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${cart.countTotal > 99 ? '99+' : cart.countTotal}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          IconButton(
            onPressed: () => showAddDialog(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemBuilder: (_, index) {
      //     return ListTile(
      //       title: Text(products.items[index].name),
      //     );
      //   },
      //   itemCount: products.count,
      // ),
      body: Consumer<Products>(builder: (context, products, _) {
        return ListView.builder(
          itemBuilder: (_, index) {
            var prod = products.items[index];
            return Card(
              child: ListTile(
                title: Text(prod.name),
                subtitle: Text(prod.description),
                leading:
                    Icon(prod.isFav ? Icons.favorite : Icons.favorite_outline),
                trailing: IconButton(
                    onPressed: () => addToCart(context, prod),
                    icon: Icon(Icons.shopping_cart)),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ProductsDetailsScreen(prodIndex: index))),
              ),
            );
          },
          itemCount: products.count,
        );
      }),
    );
  }

  void showAddDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                  onPressed: () => doAdd(context), child: const Text('Add'))
            ],
            title: const Text('Add Product'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameCtrl,
                ),
                TextField(
                  controller: descCtrl,
                ),
                TextField(
                  controller: priceCtrl,
                )
              ],
            ),
          );
        });
  }

  void doAdd(BuildContext context) {
    var prod = Product(
        id: 2,
        name: nameCtrl.text,
        description: descCtrl.text,
        price: double.parse(priceCtrl.text));
    var products = Provider.of<Products>(context, listen: false);
    products.add(prod);
    print('added');
  }

  void addToCart(BuildContext context, Product product) {
    //add to cart
    Provider.of<Cart>(context, listen: false).add(CartItem(product: product));
  }
}
