import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/bias_heading.dart';
import '../../components/charts/bar_chart_box.dart';
import '../../components/charts/card_box.dart';
import '../../components/charts/chart_data.dart';
import 'package:http/http.dart' as http;
import '../../components/charts/doughnut_chart_box.dart';
import '../../components/charts/line_chart_box.dart';
import '../../components/filter_dialog.dart';
import '../../constants.dart';

class CustomersDashboardScreen extends StatefulWidget {
  const CustomersDashboardScreen({Key? key}) : super(key: key);
  static const String id = 'customers_dashboard_screen';

  @override
  _CustomersDashboardScreen createState() => _CustomersDashboardScreen();
}

class _CustomersDashboardScreen extends State<CustomersDashboardScreen> {
  String CSTMRSPerTimeTimePeriodValue = 'Week';

  bool getCSTMRSPerTimeData = false;

  void getSalesPerTimePeriodPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/customers/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'period': CSTMRSPerTimeTimePeriodValue,
            }))
        .then((value) {
      if (value.statusCode == 200) {
        CSTMRSPerTimePeriodPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          CSTMRSPerTimePeriodPoints.add(
              ChartData(key, [data[key].toDouble() ?? 0.00], key));
        }
        setState(() {
          if (CSTMRSPerTimeTimePeriodValue == 'Week' ||
              CSTMRSPerTimeTimePeriodValue == 'Month') {
            CSTMRSPerTimePeriodPoints =
                CSTMRSPerTimePeriodPoints.reversed.toList();
          } else {
            CSTMRSPerTimePeriodPoints = CSTMRSPerTimePeriodPoints;
          }
        });
      }
    });
  }

  List<ChartData> CSTMRSPerTimePeriodPoints = [];

  String worstItemByCSTMRSTimePeriodValue = 'Week';

  bool getWorstItemByCSTMRSData = false;

  void getWorstItemBySalesPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_item_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'customers',
              'period': worstItemByCSTMRSTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        worstItemByCSTMRSPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          worstItemByCSTMRSPoints
              .add(ChartData(key, [data[key].toDouble()], key));
        }
        setState(() {
          if (CSTMRSPerTimeTimePeriodValue == 'Week' ||
              CSTMRSPerTimeTimePeriodValue == 'Month') {
            worstItemByCSTMRSPoints = worstItemByCSTMRSPoints.reversed.toList();
          } else {
            worstItemByCSTMRSPoints = worstItemByCSTMRSPoints;
          }
        });
      }
    });
  }

  List<ChartData> worstItemByCSTMRSPoints = [];

  String itemCONTRIBInCSTMRSTimePeriodValue = 'Week';

  bool getItemCONTRIBInCSTMRSData = false;

  void getItemCONTRIBInSalesPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_item_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'customers',
              'period': itemCONTRIBInCSTMRSTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        itemCONTRIBInCSTMRSPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          itemCONTRIBInCSTMRSPoints
              .add(ChartData(key, [data[key].toDouble()], key));
        }
        setState(() {
          if (CSTMRSPerTimeTimePeriodValue == 'Week' ||
              CSTMRSPerTimeTimePeriodValue == 'Month') {
            itemCONTRIBInCSTMRSPoints =
                itemCONTRIBInCSTMRSPoints.reversed.toList();
          } else {
            itemCONTRIBInCSTMRSPoints = itemCONTRIBInCSTMRSPoints;
          }
        });
      }
    });
  }

  List<ChartData> itemCONTRIBInCSTMRSPoints = [];

  String CSTMRSPerTimeTimePeriodCardValue = 'Week';

  bool getCSTMRSPerTimeCardData = false;

  void getSalesPerTimePeriodCardPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/customers/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'period': CSTMRSPerTimeTimePeriodCardValue,
            }))
        .then((value) {
      if (value.statusCode == 200) {
        CSTMRSPerTimePeriodValue = 0;
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          CSTMRSPerTimePeriodValue += data[key] ?? 0;
        }
        setState(() {
          CSTMRSPerTimePeriodValue;
        });
      }
    });
  }

  double CSTMRSPerTimePeriodValue = 0;

  String avgCSTMRSTimePeriodCardValue = 'Week';

  bool getAvgCSTMRSCardData = false;

  void getAvgSalesPeriodCardPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/customers/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'period': avgCSTMRSTimePeriodCardValue,
            }))
        .then((value) {
      if (value.statusCode == 200) {
        avgCSTMRSPeriodValue = 0;
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          avgCSTMRSPeriodValue += data[key].toDouble() ?? 0.00;
        }
        setState(() {
          avgCSTMRSPeriodValue = double.parse(
              (avgCSTMRSPeriodValue / data.keys.length).toStringAsFixed(2));
        });
      }
    });
  }

  double avgCSTMRSPeriodValue = 0;

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
    if (getCSTMRSPerTimeData) {
      getSalesPerTimePeriodPoints();
      getCSTMRSPerTimeData = false;
    }
    if (getWorstItemByCSTMRSData) {
      getWorstItemBySalesPoints();
      getWorstItemByCSTMRSData = false;
    }
    if (getItemCONTRIBInCSTMRSData) {
      getItemCONTRIBInSalesPoints();
      getItemCONTRIBInCSTMRSData = false;
    }
    if (getCSTMRSPerTimeCardData) {
      getSalesPerTimePeriodCardPoints();
      getCSTMRSPerTimeCardData = false;
    }
    if (getAvgCSTMRSCardData) {
      getAvgSalesPeriodCardPoints();
      getAvgCSTMRSCardData = false;
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
                          const BIASHeading('Customers Dashboard'),
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
                            title: 'CSTMRS PER TIME PERIOD',
                            value: CSTMRSPerTimePeriodValue,
                            valuePostfix: 'customer',
                            onChanged: (value) {
                              setState(() {
                                CSTMRSPerTimeTimePeriodCardValue = value;
                                getCSTMRSPerTimeCardData = true;
                              });
                            },
                            // isUp: true,
                            isMoney: true,
                            timePeriod: CSTMRSPerTimeTimePeriodCardValue,
                          ),
                          const SizedBox(width: 10),
                          CardBox(
                            title: 'AVG CSTMRS',
                            value: avgCSTMRSPeriodValue,
                            valuePostfix: avgCSTMRSTimePeriodCardValue == 'Day'
                                ? 'customers per hour'
                                : avgCSTMRSTimePeriodCardValue == 'Year'
                                    ? 'customers per month'
                                    : 'customers per day',
                            onChanged: (value) {
                              setState(() {
                                avgCSTMRSTimePeriodCardValue = value;
                                getAvgCSTMRSCardData = true;
                              });
                            },
                            // isUp: true,
                            isMoney: true,
                            timePeriod: avgCSTMRSTimePeriodCardValue,
                          ),
                        ],
                      ),
                    ),
                    LineChartBox(
                      data: CSTMRSPerTimePeriodPoints,
                      title: 'CSTMRS PER TIME PERIOD',
                      onChanged: (value) {
                        setState(() {
                          CSTMRSPerTimeTimePeriodValue = value;
                          getCSTMRSPerTimeData = true;
                        });
                      },
                      // value: 82.350,
                      // valuePostfix: 'JOD',
                      // isUp: true,
                      // isMoney: true,
                      timePeriod: CSTMRSPerTimeTimePeriodValue,
                    ),
                    DoughnutChartBox(
                      data: itemCONTRIBInCSTMRSPoints,
                      title: 'ITEM CONTRIB IN CSTMRS',
                      onChanged: (value) {
                        setState(() {
                          itemCONTRIBInCSTMRSTimePeriodValue = value;
                          getItemCONTRIBInCSTMRSData = true;
                        });
                      },
                      timePeriod: itemCONTRIBInCSTMRSTimePeriodValue,
                    ),
                    BarChartBox(
                      data: worstItemByCSTMRSPoints,
                      title: 'WORST ITEMS BY CSTMRS',
                      onChanged: (value) {
                        setState(() {
                          worstItemByCSTMRSTimePeriodValue = value;
                          getWorstItemByCSTMRSData = true;
                        });
                      },
                      // value: 0,
                      // valuePostfix: '',
                      // isUp: true,
                      // isMoney: true,
                      timePeriod: worstItemByCSTMRSTimePeriodValue,
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
        return const FilterDialog();
      },
    );
  }
}
