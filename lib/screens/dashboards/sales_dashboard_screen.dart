import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/bias_heading.dart';
import '../../components/charts/bar_chart_box.dart';
import '../../components/charts/card_box.dart';
import '../../components/charts/chart_data.dart';
import '../../components/charts/doughnut_chart_box.dart';
import '../../components/charts/line_chart_box.dart';
import '../../components/filter_dialog.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

class SalesDashboardScreen extends StatefulWidget {
  const SalesDashboardScreen({Key? key}) : super(key: key);
  static const String id = 'sales_dashboard_screen';

  @override
  SalesDashboardScreenState createState() => SalesDashboardScreenState();
}

class SalesDashboardScreenState extends State<SalesDashboardScreen> {
  dynamic checkedData;

  String salesPerTimeTimePeriodValue = 'Week';

  bool getSalesPerTimeData = false;

  void getSalesPerTimePeriodPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_statistics_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'quantities',
              'period': salesPerTimeTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        salesPerTimePeriodPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          salesPerTimePeriodPoints.add(ChartData(
              key, [data[key] == null ? 0.00 : data[key].toDouble()], key));
        }
        setState(() {
          if (salesPerTimeTimePeriodValue == 'Week' ||
              salesPerTimeTimePeriodValue == 'Month') {
            salesPerTimePeriodPoints =
                salesPerTimePeriodPoints.reversed.toList();
          } else {
            salesPerTimePeriodPoints = salesPerTimePeriodPoints;
          }
        });
      }
    });
  }

  List<ChartData> salesPerTimePeriodPoints = [];

  String worstItemBySalesTimePeriodValue = 'Week';

  bool getWorstItemBySalesData = false;

  void getWorstItemBySalesPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_item_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'quantities',
              'period': worstItemBySalesTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        worstItemBySalesPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          worstItemBySalesPoints
              .add(ChartData(key, [data[key].toDouble()], key));
        }
        setState(() {
          if (salesPerTimeTimePeriodValue == 'Week' ||
              salesPerTimeTimePeriodValue == 'Month') {
            worstItemBySalesPoints = worstItemBySalesPoints.reversed.toList();
          } else {
            worstItemBySalesPoints = worstItemBySalesPoints;
          }
        });
      }
    });
  }

  List<ChartData> worstItemBySalesPoints = [];

  String itemCONTRIBInSalesTimePeriodValue = 'Week';

  bool getItemCONTRIBInSalesData = false;

  void getItemCONTRIBInSalesPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_item_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'quantities',
              'period': itemCONTRIBInSalesTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        itemCONTRIBInSalesPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          itemCONTRIBInSalesPoints
              .add(ChartData(key, [data[key].toDouble()], key));
        }
        setState(() {
          if (salesPerTimeTimePeriodValue == 'Week' ||
              salesPerTimeTimePeriodValue == 'Month') {
            itemCONTRIBInSalesPoints =
                itemCONTRIBInSalesPoints.reversed.toList();
          } else {
            itemCONTRIBInSalesPoints = itemCONTRIBInSalesPoints;
          }
        });
      }
    });
  }

  List<ChartData> itemCONTRIBInSalesPoints = [];

  String salesPerTimeTimePeriodCardValue = 'Week';

  bool getSalesPerTimeCardData = false;

  void getSalesPerTimePeriodCardPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_statistics_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'quantities',
              'period': salesPerTimeTimePeriodCardValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        salesPerTimePeriodValue = 0;
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          salesPerTimePeriodValue += data[key] ?? 0;
        }
        setState(() {
          salesPerTimePeriodValue;
        });
      }
    });
  }

  double salesPerTimePeriodValue = 0;

  String avgSalesTimePeriodCardValue = 'Week';

  bool getAvgSalesCardData = false;

  void getAvgSalesPeriodCardPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_statistics_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'quantities',
              'period': avgSalesTimePeriodCardValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        avgSalesPeriodValue = 0;
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          avgSalesPeriodValue += data[key] ?? 0;
        }
        setState(() {
          avgSalesPeriodValue = double.parse(
              (avgSalesPeriodValue / data.keys.length).toStringAsFixed(2));
        });
      }
    });
  }

  double avgSalesPeriodValue = 0;

  @override
  void initState() {
    getSalesPerTimePeriodPoints();
    getWorstItemBySalesPoints();
    getItemCONTRIBInSalesPoints();
    getSalesPerTimePeriodCardPoints();
    getAvgSalesPeriodCardPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (getSalesPerTimeData) {
      getSalesPerTimePeriodPoints();
      getSalesPerTimeData = false;
    }
    if (getWorstItemBySalesData) {
      getWorstItemBySalesPoints();
      getWorstItemBySalesData = false;
    }
    if (getItemCONTRIBInSalesData) {
      getItemCONTRIBInSalesPoints();
      getItemCONTRIBInSalesData = false;
    }
    if (getSalesPerTimeCardData) {
      getSalesPerTimePeriodCardPoints();
      getSalesPerTimeCardData = false;
    }
    if (getAvgSalesCardData) {
      getAvgSalesPeriodCardPoints();
      getAvgSalesCardData = false;
    }
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 9 +
                          MediaQuery.of(context).size.width / 7,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CardBox(
                            title: 'SALES PER TIME PERIOD',
                            value: salesPerTimePeriodValue,
                            valuePostfix: 'Item',
                            onChanged: (value) {
                              setState(() {
                                salesPerTimeTimePeriodCardValue = value;
                                getSalesPerTimeCardData = true;
                              });
                            },
                            // isUp: true,
                            isMoney: true,
                            timePeriod: salesPerTimeTimePeriodCardValue,
                          ),
                          const SizedBox(width: 10),
                          CardBox(
                            title: 'AVG SALES',
                            value: avgSalesPeriodValue,
                            valuePostfix: avgSalesTimePeriodCardValue == 'Day'
                                ? 'item per hour'
                                : avgSalesTimePeriodCardValue == 'Year'
                                    ? 'item per month'
                                    : 'item per day',
                            onChanged: (value) {
                              setState(() {
                                avgSalesTimePeriodCardValue = value;
                                getAvgSalesCardData = true;
                              });
                            },
                            // isUp: true,
                            isMoney: true,
                            timePeriod: avgSalesTimePeriodCardValue,
                          ),
                        ],
                      ),
                    ),
                    LineChartBox(
                      data: salesPerTimePeriodPoints,
                      title: 'SALES PER TIME PERIOD',
                      onChanged: (value) {
                        setState(() {
                          salesPerTimeTimePeriodValue = value;
                          getSalesPerTimeData = true;
                        });
                      },
                      // value: 82.350,
                      // valuePostfix: 'JOD',
                      // isUp: true,
                      // isMoney: true,
                      timePeriod: salesPerTimeTimePeriodValue,
                    ),
                    DoughnutChartBox(
                      data: itemCONTRIBInSalesPoints,
                      title: 'ITEM CONTRIB IN SALES',
                      onChanged: (value) {
                        setState(() {
                          itemCONTRIBInSalesTimePeriodValue = value;
                          getItemCONTRIBInSalesData = true;
                        });
                      },
                      timePeriod: itemCONTRIBInSalesTimePeriodValue,
                    ),
                    BarChartBox(
                      data: worstItemBySalesPoints,
                      title: 'WORST ITEMS BY SALES',
                      onChanged: (value) {
                        setState(() {
                          worstItemBySalesTimePeriodValue = value;
                          getWorstItemBySalesData = true;
                        });
                      },
                      // value: 0,
                      // valuePostfix: '',
                      // isUp: true,
                      // isMoney: true,
                      timePeriod: worstItemBySalesTimePeriodValue,
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
