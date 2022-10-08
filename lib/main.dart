import 'package:bias/providers/stock_provider.dart';
import 'package:bias/screens/add_product_screen.dart';
import 'package:bias/screens/charts_test.dart';
import 'package:bias/screens/checkout_screen.dart';
import 'package:bias/screens/edit_product_screen.dart';
import 'package:bias/screens/home_screen.dart';
import 'package:bias/screens/product_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Stock()),
        // ChangeNotifierProvider(create: (_) => Order()),
        // ChangeNotifierProvider(create: (_) => Insight()),
      ],
      child: BIAS(),
    ),
  );
}

class BIAS extends StatelessWidget {
  BIAS({Key? key}) : super(key: key);
  bool getData = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (getData) {
      Provider.of<Stock>(context, listen: false).getStocks();
      // Provider.of<Insight>(context, listen: false).updateSalesBar();
      // Provider.of<Insight>(context, listen: false).updateSalesChart();
      getData = false;
    }

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
