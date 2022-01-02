import 'package:flutter/material.dart';
import 'package:my_shop/Providers/products.dart';
import 'package:my_shop/Providers/user_products.dart';
import 'package:my_shop/models/product.dart';
import 'package:my_shop/widgets/user_product_item_widget.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    return Consumer2<Products, UserProducts>(
        builder: (context, products, userProducts, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Your Products'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constrains) => Column(
            children: [
              SizedBox(
                height: constrains.maxHeight,
                child: ListView.builder(
                  itemCount: userProducts.items.length,
                  itemBuilder: (context, i) {

                    Product product =
                        products.getProductById(userProducts.items[i]);
                    return UserProductItemWidget(product: product);}
                  ,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
