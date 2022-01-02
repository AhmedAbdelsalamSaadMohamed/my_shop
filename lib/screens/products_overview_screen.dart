import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/Providers/cart.dart';
import 'package:my_shop/Providers/products.dart';
import 'package:my_shop/models/product.dart';
import 'package:my_shop/screens/cart_screen.dart';
import 'package:my_shop/screens/favorites_screem.dart';
import 'package:my_shop/widgets/app_drawer.dart';
import 'package:my_shop/widgets/badge.dart';
import 'package:my_shop/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  showAll,
  showFavorite,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);
  static const String routeName = '/products_overview';

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  // List<Product> loadedProducts = Products().items;
  FilterOptions filter = FilterOptions.showAll;

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(
      builder: (context, products, child) {
        List<Product> loadedProducts = filter == FilterOptions.showFavorite
            ? [
                ...(products.items
                    .where((element) => element.isFavorite == true)),
              ]
            : products.items;

        return Scaffold(
          appBar: AppBar(
            title: const Text('My Shop'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text('Show Favorite Only'),
                    value: FilterOptions.showFavorite,
                  ),
                  const PopupMenuItem(
                    child: Text('Show all'),
                    value: FilterOptions.showAll,
                  ),
                ],
                onSelected: (FilterOptions selectedItem) {
                  setState(() {
                    filter = selectedItem;
                    //products;
                  });
                },
              ),
              Consumer<Cart>(builder: (context, cart, child) {
                return Badge(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      icon: const Icon(Icons.shopping_cart),
                    ),
                    value: cart.itemCount.toString(),
                    color: Colors.deepOrangeAccent);
              })
            ],
            // leading: IconButton(
            //   icon: const Icon(
            //     Icons.favorite,
            //     color: Colors.red,
            //   ),
            //   onPressed: () {
            //     Navigator.of(context).pushNamed(FavoriteScreen.routeName);
            //   },
            // ),
          ),
          drawer: AppDrawer(),
          body: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: loadedProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0),
            itemBuilder: (context, i) {
              //print(loadedProducts[i].id);
              return ProductItemWidget(
                id: loadedProducts[i].id,
              );
            },
          ),
        );
      },
    );
  }
}
