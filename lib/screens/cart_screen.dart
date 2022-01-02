import 'package:flutter/material.dart';
import 'package:my_shop/Providers/cart.dart';
import 'package:my_shop/Providers/orders.dart';
import 'package:my_shop/Providers/products.dart';
import 'package:my_shop/models/cart_item.dart';
import 'package:my_shop/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/carts';

  @override
  Widget build(BuildContext context) {
    return Consumer2<Cart, Orders>(builder: (context, cart, orders, child) {
      //Map<String, CartItem> cart = _cart.card;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: LayoutBuilder(
          builder: (context, constrains) {
            return Column(
              children: [
                SizedBox(

                    height: constrains.maxHeight * 0.2,

                  child: Card(
                    margin: const EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Total ',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Chip(
                            label: Text(
                              cart.totalAmount.toString(),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              orders.addOrder(
                                  [...cart.cart.values], cart.totalAmount);
                              cart.clear();
                            },
                            child: const Text('Order Now'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(

                    height: constrains.maxHeight *0.8 - 10.0,

                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cart.cart.length,
                      scrollDirection: Axis.vertical,

                      itemBuilder: (context, i) {
                        return CartItemWidget(id: cart.cart.keys.elementAt(i));
                      }),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
