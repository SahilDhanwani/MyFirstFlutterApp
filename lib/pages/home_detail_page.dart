import 'package:first_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_app/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  // ignore: unnecessary_null_comparison
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.cream,
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
              .h32(context),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.convey,
            edge: VxEdge.top,
            child: Container(
              color: Colors.red,
              child: Column(
                children: [
                  catalog.name.text.xl4.color(Vx.orange400).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                  10.heightBox,
                ],
              ).py64(),
            ),
          ))
        ]),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.m0,
        children: [
          "\$$catalog.price".text.make(),
          ElevatedButton(onPressed: () {}, child: "Buy".text.make())
        ],
      ).p32(),
    );
  }
}
