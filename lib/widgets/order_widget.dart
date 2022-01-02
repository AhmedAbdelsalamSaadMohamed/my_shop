import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_shop/models/order_item.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key, required this.orderItem}) : super(key: key);
  final OrderItem orderItem;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('${widget.orderItem.amount}'),
            subtitle: Text(
              DateFormat('dd mm yyyy hh:mm').format(widget.orderItem.dateTime),
            ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
          ),
          if (_expanded)
            Container(
              height: min(widget.orderItem.products.length * 20 + 100, 120),
              child: ListView.builder(
                itemCount: widget.orderItem.products.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(widget.orderItem.products[i].title),
                    subtitle: Text(widget.orderItem.products[i].price.toString()),

                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
