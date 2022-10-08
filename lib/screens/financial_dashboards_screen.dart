import 'package:bias/screens/charts_test.dart';
import 'package:bias/screens/dashboards/profits_dashboard_screen.dart';
import 'package:bias/screens/dashboards/revenues_dashboard_screen.dart';
import 'package:bias/screens/dashboards/sales_dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/bias_text.dart';
import '../../components/dashboard_container.dart';
import '../../components/bias_heading.dart';
import '../../components/bias_title.dart';
import '../../constants.dart';
import 'dashboards/costs_dashboard_screen.dart';

class FinancialDashboardsScreen extends StatefulWidget {
  const FinancialDashboardsScreen({Key? key}) : super(key: key);
  static const String id = 'financial_dashboard_screen';

  @override
  _FinancialDashboardsScreenState createState() =>
      _FinancialDashboardsScreenState();
}

class _FinancialDashboardsScreenState extends State<FinancialDashboardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BIASHeading('Financial Dashboards'),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            CupertinoIcons.arrow_right,
                            color: kBIASDarkGrayColor,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: BIASTitle('Financial Dashboards'),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DashboardContainer(
                      onTap: () => Navigator.pushNamed(
                          context, RevenuesDashboardScreen.id),
                      title: 'Revenues\nDashboard',
                      image: AssetImage('assets/images/patterns/pattern_3.png'),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DashboardContainer(
                      onTap: () => Navigator.pushNamed(
                          context, ProfitsDashboardScreen.id),
                      title: 'Profits\nDashboard',
                      image: AssetImage('assets/images/patterns/pattern_1.png'),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DashboardContainer(
                      onTap: () =>
                          Navigator.pushNamed(context, CostsDashboardScreen.id),
                      title: 'Costs\nDashboard',
                      image: AssetImage('assets/images/patterns/pattern_2.png'),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
