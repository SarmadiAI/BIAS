import 'package:bias/components/bias_text.dart';
import 'package:bias/screens/dashboards/profits_dashboard_screen.dart';
import 'package:bias/screens/dashboards/revenues_dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/bias_heading.dart';

import '../../../components/filter_dialog.dart';

import '../../../constants.dart';

class FinancialDashboardsScreen extends StatefulWidget {
  const FinancialDashboardsScreen({Key? key}) : super(key: key);
  static const String id = 'financial_dashboard_screen';

  @override
  _FinancialDashboardsScreenState createState() =>
      _FinancialDashboardsScreenState();
}

class _FinancialDashboardsScreenState extends State<FinancialDashboardsScreen> {
  dynamic checkedData;

  List<String> financialDashboards = [
    'Revenues',
    'Profits',
    // 'Costs',
  ];
  late String currentFinancialDashboard = financialDashboards[0];
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> dashboards = {
      'Revenues': const RevenuesDashboardScreen(),
      'Profits': ProfitsDashboardScreen(),
      // 'Costs': CostsDashboardScreen(),
    };

    List<String> timePeriodsList = [
      'Day',
      'Week',
      'Month',
    ];

    String dropdownValue = timePeriodsList[0];

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
                              const SizedBox(width: 10),
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
                            style: const TextStyle(
                              color: kBIASDarkGrayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            icon: const Icon(
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
        return FilterDialog(func: function);
      },
    );
    print(checkedData);
  }

  function(value) => setState(() => checkedData = value);
}
