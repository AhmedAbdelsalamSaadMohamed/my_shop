import 'package:flutter/material.dart';
import 'package:my_shop/Providers/cart.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Dismissible(
          key: ValueKey(id),
          background: Container(
            color: Theme.of(context).errorColor,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              // size:40,
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            cart.deleteProduct(id);
          },
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                contentPadding: const EdgeInsets.all(10),
                content: const Text('Do you want to delete item from Cart'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('NO')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('YES')),
                ],
              ),
            );
          },
          child:
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(

                children: [
                  
                  
                  Flexible(
                    fit: FlexFit.tight,
                    child: ListTile(
                      dense: true,
                      isThreeLine: false,
                      leading: CircleAvatar(
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child:
                                FittedBox(child: Text('${cart.cart[id]!.price}'))),
                      ),
                       title: Text(cart.cart[id]!.title),
                      subtitle: Text(
                        'Total \$${cart.cart[id]!.price * cart.cart[id]!.quantity}',
                      ),
                       trailing: Text('x${cart.cart[id]!.quantity}'),

                    ),
                  ),
                  IconButton(onPressed: (){cart.deleteSingleItem(id);}, icon: Icon(Icons.minimize))

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
