import 'package:flutter/material.dart';
import 'package:minimal_ecommerse_app/models/products.dart';

class Shop extends ChangeNotifier {
  //Products for sale
  final List<Products> _shop = [
    //product 1
    Products(
        name: 'Product 1',
        describtion: 'Description is like a products overview',
        price: 99.9,
        imagePath: 'assets/sneakers.png'),
    //product 2
    Products(
        name: 'Product 2',
        describtion: 'Description',
        price: 89.9,
        imagePath: 'assets/watch.png'),
    //product 3
    Products(
        name: 'Product 3',
        describtion: 'Description',
        price: 79.9,
        imagePath: 'assets/laptop.png'),
    //product 4
    Products(
        name: 'Product 4',
        describtion: 'Description',
        price: 69.9,
        imagePath: 'assets/phone.png'),
  ];

  //user cart
  final List<Products> _cart = [];

  //get product list
  List<Products> get shop => _shop;

  //get user cart
  List<Products> get cart => _cart;

  //add item to cart
  void addToCart(Products item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Products item) {
    _cart.remove(item);
    notifyListeners();
  }
}
