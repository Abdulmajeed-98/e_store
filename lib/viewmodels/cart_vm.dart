import 'package:flutter/material.dart';
import 'package:mokhtar_e_store/models/product.dart';

class CartVM extends ChangeNotifier {
  List<Map<Product,int>> _items = [];
  List<Map<Product,int>> get items => _items;
  void addItem(Product item) {
    _items.add({item:1});
    notifyListeners();
  }

  static double calcTotalAmount(List<Map<Product, int>> items) {
    double amount = 0.0;
    items.forEach((e) {
      e.forEach((k, v) {
        amount += k.price * v;
      });
    });
    return amount;
  }

  static double addQty(){
    return 0;
  }
}
