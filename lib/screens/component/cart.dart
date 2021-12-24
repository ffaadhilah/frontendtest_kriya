import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;

  void increaseItem(index) {
    if (_cart.containsKey(index)) {
      _cart[index] += 1;
    } else {
      _cart[index] = 1;
    }
    notifyListeners();
  }

  void descreaseItem(index) {
    if (_cart.containsKey(index) && _cart[index] > 0) {
      _cart[index] -= 1;
    }
    if (_cart[index] <= 0) {
      _cart.remove(index);
    }
    notifyListeners();
  }

}
