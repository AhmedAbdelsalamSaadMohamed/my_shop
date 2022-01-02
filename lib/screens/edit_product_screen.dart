import 'package:flutter/material.dart';
import 'package:my_shop/Providers/products.dart';
import 'package:my_shop/models/product.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  static const routeName = '/edit-product';

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;

    Products products = Provider.of<Products>(context);
    final Product product =
        products.items.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product ${product.title}'),
      ),
      body: LayoutBuilder(
        builder: (context, constrains) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: constrains.maxHeight * 0.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Form(
                    child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('Title'),
                          icon: Icon(Icons.password),
                          hintText: 'hinttttttttttt',
                          hintStyle: TextStyle(color: Colors.black26)),
                      ///textInputAction: TextInputAction.next,
                       onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      // onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                      //   FocusScope.of(context).nextFocus();
                      // },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      //focusNode: FocusNode(),
                    ),
                    const Divider(),
                    TextFormField(),
                  ],
                )),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
