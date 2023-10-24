import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/drawer.dart';
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
    CatalogModel.products =
        List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
      ),
      body: Padding(
        padding : const EdgeInsets.all(16),
        // ignore: unnecessary_null_comparison
        child : (CatalogModel.products != null && CatalogModel.products.isNotEmpty)
         ? ListView.builder(
        itemCount: CatalogModel.products.length,
        itemBuilder: (context, index) {
          return ProuctWidget(product: CatalogModel.products[index]);
        },
        ) : const Center(child: CircularProgressIndicator(),
       ), 
      ),
      drawer: const Drawerpage(),
    );
  }
}
