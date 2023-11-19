import 'package:first_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.cream,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        body: Column(
          children: [
            const Placeholder().expand().p16(),
            const Divider(),
            const _cartTotal()
          ],
        ));
  }
}

// ignore: camel_case_types
class _cartTotal extends StatelessWidget {
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$99999".text.xl5.make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.brown)
            ), 
            child: "buy".text.xl4.make(),
          ).w32(context)
        ],
      ),
    );
  }
}


// ignore: camel_case_types
class _cartList extends StatefulWidget {
  const _cartList({super.key});

  @override
  State<_cartList> createState() => __cartListState();
}

// ignore: camel_case_types
class __cartListState extends State<_cartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context,index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.remove_shopping_cart_outlined)
          ),
        title: "Item 1".text.make(),
        )
      );
  }
}
