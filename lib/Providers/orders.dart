import 'package:flutter/cupertino.dart';
import 'package:my_shop/models/cart_item.dart';
import 'package:my_shop/models/order_item.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> products, double amount) {
    _orders.add(
      OrderItem(
        id: DateTime.now().toString(),
        products: products,
        amount: amount,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
