import 'package:flutter/cupertino.dart';
import 'package:my_shop/models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _cart = {};

  int get itemCount {
    int count = 0;
    for (var element in _cart.values) {
      count += element.quantity;
    }
    return count;
  }

  double get totalAmount {
    double count = 0;
    for (var element in _cart.values) {
      count += (element.quantity * element.price);
    }
    return count;
  }

  Map<String, CartItem> get cart => {..._cart};

  void addItem(CartItem item) {
    if (_cart.keys.contains(item.id)) {
      _cart[item.id]!.quantity += item.quantity;
    } else {
      _cart.addAll(<String, CartItem>{item.id: item});
    }
    notifyListeners();
  }

  void deleteProduct(String id) {
    _cart.remove(id);
    notifyListeners();
  }

  void deleteSingleItem(String id) {
    if (_cart.keys.contains(id)) {
      if (_cart[id]!.quantity > 1) {
        _cart.update(
            id,
            (existingItem) => CartItem(
                id: id,
                quantity: existingItem.quantity - 1,
                price: existingItem.price,
                title: existingItem.title));
      } else if (_cart[id]!.quantity == 1) {
        deleteProduct(id);
      }
      notifyListeners();
    } else {
      return;
    }
  }

  void clear() {
    _cart = {};
    notifyListeners();
  }
}
