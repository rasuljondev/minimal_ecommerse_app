import 'package:flutter/material.dart';
import 'package:minimal_ecommerse_app/components/my_button.dart';
import 'package:minimal_ecommerse_app/models/products.dart';
import 'package:minimal_ecommerse_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart method

  void removeItemFromCart(BuildContext context, Products product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from your cart?'),
        actions: [
          //cancell
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          //confirm
          MaterialButton(
            onPressed: () => {
              //pop dialog
              Navigator.pop(context),
              //add to cart
              context.read<Shop>().removeFromCart(product)
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("User wants to pay!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text("Your cart is empty..."))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        //get individual item in cart

                        final item = cart[index];

                        //return as a cart tile UI

                        return Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  //product image
                                  Container(
                                    child: Image.asset(
                                      item.imagePath,
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),

                                  //product name
                                  Column(
                                    children: [
                                      Text(
                                        item.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      //product price
                                      Text(
                                        '\$${item.price.toStringAsFixed(2)}',
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () =>
                                      removeItemFromCart(context, item),
                                  icon: const Icon(Icons.cancel_outlined))
                            ],
                          ),
                        );
                      })),

          //pay button

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}
