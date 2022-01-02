import 'package:flutter/material.dart';
import 'package:my_shop/Providers/products.dart';
import 'package:my_shop/models/product.dart';
import 'package:my_shop/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  static const String routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(
      builder: (context, products, child) {
        List<Product> favoriteProducts = [
          ...(products.items.where((element) => element.isFavorite == true)),
        ];
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Shop'),
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: favoriteProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0),
            itemBuilder: (context, i) => ProductItemWidget(
              id: favoriteProducts[i].id,
            ),
          ),
        );
      },
    );
  }
}
