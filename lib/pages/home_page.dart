import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/drawer.dart';
// ignore: unused_import
import 'package:first_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 29;

  final String name = "SAHIL D's APP";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJSON =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJSON);
    var productsData = decodedData["products"];
    CatalogModel.products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
            // ignore: unnecessary_null_comparison
            (CatalogModel.products != null && CatalogModel.products.isNotEmpty)
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16),
                    itemBuilder: ((context, index) {
                      final item = CatalogModel.products[index];
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: GridTile(
                          header: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple
                            ),
                            child: Text(
                              item.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            ),
                          footer: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple
                            ),
                            child: Text(
                              item.price.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                            ),
                          child: Image.network(item.image),
                          ));
                    }),
                    itemCount: CatalogModel.products.length)
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
      drawer: const Drawerpage(),
    );
  }
}
