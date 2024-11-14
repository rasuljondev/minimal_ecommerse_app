import 'package:flutter/material.dart';
import 'package:minimal_ecommerse_app/components/my_drawer.dart';
import 'package:minimal_ecommerse_app/components/my_product_tile.dart';
import 'package:minimal_ecommerse_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop

    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        actions: [
          //go to cart button
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Page"),
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),

          //shop subtitle
          Center(
              child: Text(
            "Pick from a selected list of premium products",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          )),
          //product list

          SizedBox(
            height: 550,
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                //get each individual products
                final product = products[index];

                //return as a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
