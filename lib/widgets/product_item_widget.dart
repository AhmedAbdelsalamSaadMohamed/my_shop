import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/Providers/cart.dart';
import 'package:my_shop/Providers/products.dart';
import 'package:my_shop/Providers/user_products.dart';
import 'package:my_shop/models/cart_item.dart';
import 'package:my_shop/models/product.dart';
import 'package:my_shop/screens/edit_product_screen.dart';
import 'package:my_shop/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    String id = widget.id;
    var userProducts = Provider.of<UserProducts>(context);
    return Consumer<Products>(
      builder: (context, products, child) {
        Product product =
            products.items.firstWhere((element) => element.id == id);
        return ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                    arguments: id);
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            footer: GridTileBar(
              leading: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: product.isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    products.changeProductFavorite(id);
                  });
                },
              ),
              backgroundColor: Colors.black45,
              title: Text(
                product.title,
                // textAlign:TextAlign.center ,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Consumer<Cart>(
                builder: (context, cart, child) {
                  return IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      cart.addItem(CartItem(
                          id: id,
                          quantity: 1,
                          price: product.price,
                          title: product.title));

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Added ${product.title} to Cart'),
                        duration: const Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            cart.deleteSingleItem(id);
                          },
                        ),
                      ));
                    },
                  );
                },
              ),
            ),
            header: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                userProducts.items.contains(id)
                    ? IconButton(
                        icon: const Icon(Icons.turned_in , color: Colors.deepOrangeAccent,),
                        onPressed: ()=> userProducts.deleteUserProduct(id: id),
                      )
                    : IconButton(
                        icon: const Icon(Icons.turned_in_not , color: Colors.deepOrangeAccent, ),
                        onPressed: () => userProducts.addUserProduct(id: id),
                      ),
                IconButton(onPressed: (){
                  Navigator.of(context).pushNamed(EditProductScreen.routeName,arguments: id);
                }, icon:const Icon(Icons.edit))
              ],
            ),
          ),
        );
      },
    );
  }
}
