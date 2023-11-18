// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:first_app/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  // ignore: unnecessary_null_comparison
  const HomeDetailPage({ Key? key, required this.catalog,}) : assert(catalog != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Image.network(catalog.image),
        ]
      ),
    );
  }
}
