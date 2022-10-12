import 'package:bias/components/bias_text.dart';
import 'package:bias/screens/dashboards/costs_dashboard_screen.dart';
import 'package:bias/screens/dashboards/profits_dashboard_screen.dart';
import 'package:bias/screens/dashboards/revenues_dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/bias_heading.dart';

import '../../components/charts/bar_chart_box.dart';
import '../../components/charts/card_box.dart';
import '../../components/charts/chart_data.dart';
import '../../components/charts/column_chart_box.dart';
import '../../components/charts/doughnut_chart_box.dart';
import '../../components/charts/line_chart_box.dart';
import '../../components/filter_dialog.dart';

import '../../constants.dart';

class FinancialDashboardsScreen extends StatefulWidget {
  const FinancialDashboardsScreen({Key? key}) : super(key: key);
  static const String id = 'financial_dashboard_screen';

  @override
  _FinancialDashboardsScreenState createState() =>
      _FinancialDashboardsScreenState();
}

class _FinancialDashboardsScreenState extends State<FinancialDashboardsScreen> {
  List<ChartData> data = [
    ChartData('24 Sep - Sat', [9], 'one'),
    ChartData('25 Sep - Sun', [24], 'two'),
    ChartData('26 Sep - Mon', [34], 'three'),
    ChartData('27 Sep - Tue', [13], 'four'),
    ChartData('28 Sep - Wed', [30], 'five'),
    ChartData('29 Sep - Thu', [45], 'six'),
    ChartData('30 Sep - Fri', [11], 'seven')
  ];
  List<String> financialDashboards = [
    'Revenues',
    'Profits',
    'Costs',
  ];
  late String currentFinancialDashboard = financialDashboards[0];
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> dashboards = {
      'Revenues': RevenuesDashboardScreen(),
      'Profits': ProfitsDashboardScreen(),
      'Costs': CostsDashboardScreen(),
    };

    List<String> _timePeriodsList = [
      'Day',
      'Week',
      'Month',
    ];
    String dropdownValue = _timePeriodsList[0];

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: CupertinoColors.extraLightBackgroundGray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 140,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BIASHeading('Financial Dashboard'),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showFilterDialog();
                                },
                                child: const Icon(
                                  Icons.filter_list,
                                  color: kBIASDarkGrayColor,
                                  size: 28,
                                ),
                              ),
                              SizedBox(width: 10),
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            style: TextStyle(
                              color: kBIASDarkGrayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            icon: Icon(
                              CupertinoIcons.ellipsis,
                              color: Colors.white,
                            ),
                            value: currentFinancialDashboard,
                            isDense: true,
                            onChanged: (value) {
                              setState(() {
                                currentFinancialDashboard = value!;
                              });
                            },
                            items: financialDashboards.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: BIASText(value,
                                    color: kBIASDarkGrayColor.withOpacity(0.9),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 2),
              dashboards[currentFinancialDashboard]!,
            ],
          ),
        ),
      ),
    );
  }

  showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return FilterDialog();
      },
    );
  }
}
