import 'package:flutter/material.dart';
import 'package:my_shop/Providers/orders.dart';
import 'package:my_shop/widgets/order_widget.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const roureName ='/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Consumer<Orders>(
        builder: (context, orders, body) {
          return ListView.builder(
            itemCount: orders.orders.length,
            itemBuilder: (context, i) => OrderWidget(orderItem: orders.orders[i]),
          );
        },
      ),
    );
  }
}
