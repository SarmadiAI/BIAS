import 'dart:developer';

import 'package:bias/components/items_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parent_child_checkbox/parent_child_checkbox.dart';
import '../../components/bias_heading.dart';
import '../../components/bias_text.dart';
import '../../components/bias_title.dart';
import '../../components/charts/bar_chart_box.dart';
import '../../components/charts/card_box.dart';
import '../../components/charts/chart_data.dart';
import '../../components/charts/column_chart_box.dart';
import '../../components/charts/doughnut_chart_box.dart';
import '../../components/charts/line_chart_box.dart';
import '../../components/filter_dialog.dart';
import '../../components/items.dart';
import '../../constants.dart';

class SalesDashboardScreen extends StatefulWidget {
  const SalesDashboardScreen({Key? key}) : super(key: key);
  static const String id = 'sales_dashboard_screen';

  @override
  _SalesDashboardScreenState createState() => _SalesDashboardScreenState();
}

class _SalesDashboardScreenState extends State<SalesDashboardScreen> {
  dynamic checkedData;

  List<ChartData> data = [
    ChartData('24 Sep - Sat', [9], 'one'),
    ChartData('25 Sep - Sun', [24], 'two'),
    ChartData('26 Sep - Mon', [34], 'three'),
    ChartData('27 Sep - Tue', [13], 'four'),
    ChartData('28 Sep - Wed', [30], 'five'),
    ChartData('29 Sep - Thu', [45], 'six'),
    ChartData('30 Sep - Fri', [11], 'seven')
  ];
  @override
  Widget build(BuildContext context) {
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
                height: 100,
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
                          const BIASHeading('Sales Dashboard'),
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Expanded(
                child: ListView(
                  children: [
                    LineChartBox(
                      data: data,
                      title: 'SALES PER TIME PERIOD',
                      value: 82.350,
                      valuePostfix: 'JOD',
                      isUp: true,
                      isMoney: true,
                      timePeriod: 'm',
                    ),
                    ColumnChartBox(
                      data: data,
                      title: 'SALES ON EACH DAY',
                      value: 82.350,
                      valuePostfix: 'JOD',
                      isUp: true,
                      isMoney: true,
                      timePeriod: 'm',
                    ),
                    ColumnChartBox(
                      data: data,
                      title: 'SALES ON EACH HOUR',
                      value: 82.350,
                      valuePostfix: 'JOD',
                      isUp: true,
                      isMoney: true,
                      timePeriod: 'm',
                    ),
                    BarChartBox(
                      data: data,
                      title: 'BEST ITEMS BY SALES',
                      value: 82.350,
                      valuePostfix: 'JOD',
                      isUp: true,
                      isMoney: true,
                      timePeriod: 'm',
                    ),
                    BarChartBox(
                      data: data,
                      title: 'WORST ITEMS BY SALES',
                      value: 82.350,
                      valuePostfix: 'JOD',
                      isUp: true,
                      isMoney: true,
                      timePeriod: 'm',
                    ),
                    DoughnutChartBox(
                      data: data,
                      title: 'ITEM CONTRIB IN SALES',
                      value: 82.350,
                      valuePostfix: 'JOD',
                      isUp: true,
                      isMoney: true,
                      timePeriod: 'm',
                    ),
                    CardBox(
                      data: data,
                      title: 'SALES PER TIME PERIOD',
                      value: 82.350,
                      valuePostfix: 'JOD',
                      isUp: true,
                      isMoney: true,
                      timePeriod: 'm',
                    ),
                    CardBox(
                      data: data,
                      title: 'AVG SALES',
                      value: 82.350,
                      valuePostfix: 'JOD',
                      isUp: true,
                      isMoney: true,
                      timePeriod: 'm',
                    ),
                    CardBox(
                      data: data,
                      title: 'TOP ITEM BY SALES',
                      value: 82.350,
                      valuePostfix: 'JOD',
                      isUp: true,
                      isMoney: true,
                      timePeriod: 'm',
                    ),
                  ],
                ),
              ),
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
  }

  function(value) => setState(() => checkedData = value);
}
