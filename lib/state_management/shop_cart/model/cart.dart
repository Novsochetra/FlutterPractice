import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<int> list = [];
  Map<int, CartItemType> byId = {};

  int get total => list.length;

  void addToCart(int id, String name) {
    _updateIds(id);
    _updateById(id, name);
    notifyListeners();
  }

  void removeCart(int id) {
    list.removeWhere((i) => i == id);
    notifyListeners();
  }

  void _updateById(int id, String name) {
    byId[id] = CartItemType(id, name);
    print("$id updated $byId");
  }

  void _updateIds(int id) {
    if (!list.contains(id)) {
      list.add(id);
      print("added $list");
    }
  }
}

@immutable
class CartItemType {
  final int id;
  final String name;

  CartItemType(this.id, this.name);
}
