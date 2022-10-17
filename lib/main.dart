import 'package:bias/providers/receipt_provider.dart';
import 'package:bias/providers/stock_provider.dart';
import 'package:bias/screens/add_product_screen.dart';
import 'package:bias/screens/charts_test.dart';
import 'package:bias/screens/checkout_screen.dart';
import 'package:bias/screens/dashboards/costs_dashboard_screen.dart';
import 'package:bias/screens/dashboards/customers_dashboard_screen.dart';
import 'package:bias/screens/dashboards/profits_dashboard_screen.dart';
import 'package:bias/screens/dashboards/revenues_dashboard_screen.dart';
import 'package:bias/screens/edit_product_screen.dart';
import 'package:bias/screens/home_screen.dart';
import 'package:bias/screens/product_info_screen.dart';
import 'package:bias/screens/dashboards/financial_dashboards_screen.dart';
import 'package:bias/screens/dashboards/sales_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Stock()),
        ChangeNotifierProvider(create: (_) => Receipt()),
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

        CheckoutScreen.id: (context) => CheckoutScreen(),
        // CostsDashboardScreen.id: (context) => CostsDashboardScreen(),
        CustomersDashboardScreen.id: (context) => CustomersDashboardScreen(),
        ProfitsDashboardScreen.id: (context) => ProfitsDashboardScreen(),
        // RevenuesDashboardScreen.id: (context) => RevenuesDashboardScreen(),
        FinancialDashboardsScreen.id: (context) => FinancialDashboardsScreen(),
        // ChartsTest.id: (context) => ChartsTest(),
        EditProductScreen.id: (context) => EditProductScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProductInfoScreen.id: (context) => ProductInfoScreen(),
        SalesDashboardScreen.id: (context) => SalesDashboardScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
