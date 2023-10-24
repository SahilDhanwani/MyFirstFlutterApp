import 'package:first_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ProuctWidget extends StatelessWidget {
  final Item product;

  const ProuctWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // print("${product.name}is Pressed");
        },
        leading: Image(image: NetworkImage(product.image)),
        title: Text(product.name),
        subtitle: Text(product.desc),
        trailing: Text("\$ ${product.price}"),
      ),
    );
  }
}
