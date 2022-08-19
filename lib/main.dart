import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_hometask/models/catalog.dart';
import 'package:provider_hometask/pages/cart_page.dart';
import 'package:provider_hometask/pages/catalog_page.dart';

import 'models/cart.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(create: (context) => CatalogModel()),

      ChangeNotifierProxyProvider<CatalogModel, CartModel>(
        create: (context) => CartModel(),
        update: (context, catalog, cart) {
          if (cart == null) throw ArgumentError.notNull('cart');
          cart.catalog = catalog;
          return cart;
        },
      ),

    ],
    child: MaterialApp(
      home: const MyCatalog(),
      routes: {
        '/catalog': (context) => const MyCatalog(),
        '/cart': (context) => const MyCart(),
      },
    ),
    );
  }
}
