import 'package:flutter/material.dart';
import 'package:my_shop/Providers/products.dart';
import 'package:my_shop/models/product.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/product_details';

  @override
  Widget build(BuildContext context) {
    Product product = Products()
        .getProductById(ModalRoute.of(context)!.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constrains) => Column(
          children: [
            SizedBox(
              height: constrains.maxHeight * 0.05,
            ),
            SizedBox(
              height: constrains.maxHeight * 0.5,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: constrains.maxHeight * 0.4,
              child: Column(
                children: [
                  Text(product.price.toString() + '\$'),
                  Text(product.description),
                ],
              ),
            ),
            SizedBox(
              height: constrains.maxHeight * 0.05,
            ),
          ],
        ),
      ),

    );
  }
}
