// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:first_app/models/cartModel.dart';
import 'package:first_app/models/catalog.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late cartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = cartModel();
    cart.catalog = catalog;
  }
}
