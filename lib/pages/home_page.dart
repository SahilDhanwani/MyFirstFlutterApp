// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:first_app/models/catalog.dart';
// ignore: unused_import
import 'package:first_app/widgets/product_widget.dart';
import 'package:first_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: MyTheme.cream,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const CatalogHeader(),
            // ignore: unnecessary_null_comparison
            if(CatalogModel.products != null && CatalogModel.products.isNotEmpty)
              const CatalogList().expand()
            else
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    )
  );

  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "catalog app".text.xl5.bold.color(MyTheme.cream).make(),
        "Trending Products : ".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.products.length,
      itemBuilder: ((context, index) {
        final catalog = CatalogModel.products[index];
        return catalogItem(catalog: catalog);
      }),
    );
  }
}

// ignore: camel_case_types
class catalogItem extends StatelessWidget {
  
  const catalogItem({ Key? key, required this.catalog,})
   // ignore: unnecessary_null_comparison
   :assert(catalog != null), super(key: key);

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Image.network(
            catalog.image
          ).box.p8.color(MyTheme.cream).make().py16().w40(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.xl.color(Vx.orange400).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.m0,
                  children: [
                    "\$$catalog.price".text.make(),
                    ElevatedButton(
                      onPressed: () {},
                      child: "Buy".text.make()
                    )
                  ],
                ).pOnly(right: 8)
              ],
            )
          )
        ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}
