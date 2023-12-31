import 'package:first_app/models/cartModel.dart';
import 'package:first_app/models/catalog.dart';
import 'package:first_app/pages/home_detail_page.dart';
import 'package:first_app/store/store.dart';
import 'package:first_app/utilities/routes.dart';
import 'package:first_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

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

    const url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

    final response = await http.get(Uri.parse(url));
    final catalogJSON = response.body;
    // final catalogJSON = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJSON);
    var productsData = decodedData["products"];
    CatalogModel.products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: MyTheme.cream,
        floatingActionButton: VxBuilder(
            mutations: const {RemoveMutation, AddMutation},
            builder: (BuildContext context, store, VxStatus? status) {
              return FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RoutePage.cartPage),
                child: const Icon(Icons.shopping_bag_outlined),
              ).badge(size: 20, count: cart.items.length);
            }),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                // ignore: unnecessary_null_comparison
                if (CatalogModel.products != null &&
                    CatalogModel.products.isNotEmpty)
                  const CatalogList().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
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
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => HomeDetailPage(catalog: catalog)))),
            child: catalogItem(catalog: catalog));
      }),
    );
  }
}

// ignore: camel_case_types
class catalogItem extends StatelessWidget {
  const catalogItem({
    Key? key,
    required this.catalog,
  })  
  // ignore: unnecessary_null_comparison
  : assert(catalog != null),
        super(key: key);

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: Image.network(catalog.image)
              .box
              .p8
              .color(MyTheme.cream)
              .make()
              .py16()
              .w40(context),
        ),
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
                _addToCart(catalog: catalog)
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

// ignore: camel_case_types
class _addToCart extends StatelessWidget {
  final Item catalog;
  const _addToCart({
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final cartModel cart = (VxState.store as MyStore).cart;

    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
            // setState(() {});
          }
        },
        child: isInCart ? const Icon(Icons.done) : "Buy".text.make());
  }
}
