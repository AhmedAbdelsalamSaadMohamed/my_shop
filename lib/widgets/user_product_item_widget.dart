import 'package:flutter/material.dart';
import 'package:my_shop/models/product.dart';

class UserProductItemWidget extends StatelessWidget {
  const UserProductItemWidget({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListTile(
        title: Text(product.title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.imageUrl),
        ),
      ),
    );
  }
}
