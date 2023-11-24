import 'package:first_app/models/cartModel.dart';
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
            _cartTotal()
          ],
        ));
  }
}

// ignore: camel_case_types
class _cartTotal extends StatelessWidget {
  final _cart = cartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${_cart.totalPrice}".text.xl5.make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying is not yet supported".text.make(),
              ));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.brown)),
            child: "buy".text.xl4.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _cartList extends StatefulWidget {
  const _cartList();

  @override
  State<_cartList> createState() => __cartListState();
}

// ignore: camel_case_types
class __cartListState extends State<_cartList> {
  final _cart = cartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  title: _cart.items[index].name.text.make(),
                  trailing: IconButton(
                      onPressed: () {
                        _cart.remove(_cart.items[index]);
                      },
                      icon: const Icon(Icons.remove_shopping_cart_outlined)),
                ));
  }
}
