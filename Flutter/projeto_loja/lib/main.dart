import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_loja/models/cart.dart';
import 'package:projeto_loja/pages/product_detail_page.dart';
import 'package:projeto_loja/pages/products_overview_page.dart';
import 'package:projeto_loja/utils/app_routes.dart';

import 'models/product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = new ThemeData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: tema.copyWith(
          colorScheme: tema.colorScheme
              .copyWith(primary: Colors.purple, secondary: Colors.deepOrange),
          textTheme: tema.textTheme
              .copyWith(headline6: tema.textTheme.headline6)
              .apply(
                fontFamily: 'Lato',
              ),
        ),
        home: ProductsOverviewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
