import 'package:bias/screens/add_product_screen.dart';
import 'package:bias/screens/charts_test.dart';
import 'package:bias/screens/checkout_screen.dart';
import 'package:bias/screens/edit_product_screen.dart';
import 'package:bias/screens/home_screen.dart';
import 'package:bias/screens/product_info_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BIAS());
}

class BIAS extends StatelessWidget {
  const BIAS({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIAS',
      routes: {
        AddProductScreen.id: (context) => AddProductScreen(),
        ChartsTest.id: (context) => ChartsTest(),
        CheckoutScreen.id: (context) => CheckoutScreen(),
        EditProductScreen.id: (context) => EditProductScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProductInfoScreen.id: (context) => ProductInfoScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
