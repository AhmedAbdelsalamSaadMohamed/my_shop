import 'package:my_shop/models/cart_item.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
 
  OrderItem({
    required this.id,
    required this.products,
    required this.amount,
    required this.dateTime,
  });
}
