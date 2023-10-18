import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:first_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 29;
  final String name = "SAHIL D's APP";

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.products[0]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
      ),
      body: ListView.builder(
        // itemCount: CatalogModel.products.length,
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ProuctWidget(product: dummyList[index]);
        },
      ),
      drawer: const Drawerpage(),
    );
  }
}
