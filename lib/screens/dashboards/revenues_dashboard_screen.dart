import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../components/charts/bar_chart_box.dart';
import '../../components/charts/card_box.dart';
import '../../components/charts/chart_data.dart';
import '../../components/charts/doughnut_chart_box.dart';
import '../../components/charts/line_chart_box.dart';

class RevenuesDashboardScreen extends StatefulWidget {
  const RevenuesDashboardScreen({Key? key}) : super(key: key);
  static const String id = 'revenues_dashboard_screen';

  @override
  _RevenuesDashboardScreenState createState() =>
      _RevenuesDashboardScreenState();
}

class _RevenuesDashboardScreenState extends State<RevenuesDashboardScreen> {
  String revenuesPerTimeTimePeriodValue = 'Week';

  bool getRevenuesPerTimeData = false;

  void getSalesPerTimePeriodPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_statistics_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'revenues',
              'period': revenuesPerTimeTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        revenuesPerTimePeriodPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          revenuesPerTimePeriodPoints
              .add(ChartData(key, [data[key] ?? 0], key));
        }
        setState(() {
          if (revenuesPerTimeTimePeriodValue == 'Week' ||
              revenuesPerTimeTimePeriodValue == 'Month') {
            revenuesPerTimePeriodPoints =
                revenuesPerTimePeriodPoints.reversed.toList();
          } else {
            revenuesPerTimePeriodPoints = revenuesPerTimePeriodPoints;
          }
        });
      }
    });
  }

  List<ChartData> revenuesPerTimePeriodPoints = [];

  String worstItemByRevenuesTimePeriodValue = 'Week';

  bool getWorstItemByRevenuesData = false;

  void getWorstItemBySalesPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_item_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'revenues',
              'period': worstItemByRevenuesTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        worstItemByRevenuesPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          worstItemByRevenuesPoints.add(ChartData(key, [data[key]], key));
        }
        setState(() {
          if (revenuesPerTimeTimePeriodValue == 'Week' ||
              revenuesPerTimeTimePeriodValue == 'Month') {
            worstItemByRevenuesPoints =
                worstItemByRevenuesPoints.reversed.toList();
          } else {
            worstItemByRevenuesPoints = worstItemByRevenuesPoints;
          }
        });
      }
    });
  }

  List<ChartData> worstItemByRevenuesPoints = [];

  String itemCONTRIBInRevenuesTimePeriodValue = 'Week';

  bool getItemCONTRIBInRevenuesData = false;

  void getItemCONTRIBInSalesPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_item_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'revenues',
              'period': itemCONTRIBInRevenuesTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        itemCONTRIBInRevenuesPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          itemCONTRIBInRevenuesPoints.add(ChartData(key, [data[key]], key));
        }
        setState(() {
          if (revenuesPerTimeTimePeriodValue == 'Week' ||
              revenuesPerTimeTimePeriodValue == 'Month') {
            itemCONTRIBInRevenuesPoints =
                itemCONTRIBInRevenuesPoints.reversed.toList();
          } else {
            itemCONTRIBInRevenuesPoints = itemCONTRIBInRevenuesPoints;
          }
        });
      }
    });
  }

  List<ChartData> itemCONTRIBInRevenuesPoints = [];

  String revenuesPerTimeTimePeriodCardValue = 'Week';

  bool getRevenuesPerTimeCardData = false;

  void getSalesPerTimePeriodCardPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_statistics_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'revenues',
              'period': revenuesPerTimeTimePeriodCardValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        revenuesPerTimePeriodValue = 0;
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          revenuesPerTimePeriodValue += data[key] ?? 0;
        }
        setState(() {
          revenuesPerTimePeriodValue;
        });
      }
    });
  }

  double revenuesPerTimePeriodValue = 0;

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
              'statistics_type': 'revenues',
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
    if (getRevenuesPerTimeData) {
      getSalesPerTimePeriodPoints();
      getRevenuesPerTimeData = false;
    }
    if (getWorstItemByRevenuesData) {
      getWorstItemBySalesPoints();
      getWorstItemByRevenuesData = false;
    }
    if (getItemCONTRIBInRevenuesData) {
      getItemCONTRIBInSalesPoints();
      getItemCONTRIBInRevenuesData = false;
    }
    if (getRevenuesPerTimeCardData) {
      getSalesPerTimePeriodCardPoints();
      getRevenuesPerTimeCardData = false;
    }
    if (getAvgSalesCardData) {
      getAvgSalesPeriodCardPoints();
      getAvgSalesCardData = false;
    }
    return Expanded(
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 9 +
                MediaQuery.of(context).size.width / 7,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CardBox(
                  title: 'REVENUES PER TIME PERIOD',
                  value: revenuesPerTimePeriodValue,
                  valuePostfix: 'JOD',
                  onChanged: (value) {
                    setState(() {
                      revenuesPerTimeTimePeriodCardValue = value;
                      getRevenuesPerTimeCardData = true;
                    });
                  },
                  // isUp: true,
                  isMoney: true,
                  timePeriod: revenuesPerTimeTimePeriodCardValue,
                ),
                const SizedBox(width: 10),
                CardBox(
                  title: 'AVG SALES',
                  value: avgSalesPeriodValue,
                  valuePostfix: avgSalesTimePeriodCardValue == 'Day'
                      ? 'JOD per hour'
                      : avgSalesTimePeriodCardValue == 'Year'
                          ? 'JOD per month'
                          : 'JOD per day',
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
            data: revenuesPerTimePeriodPoints,
            title: 'revenues PER TIME PERIOD',
            onChanged: (value) {
              setState(() {
                revenuesPerTimeTimePeriodValue = value;
                getRevenuesPerTimeData = true;
              });
            },
            // value: 82.350,
            // valuePostfix: 'JOD',
            // isUp: true,
            // isMoney: true,
            timePeriod: revenuesPerTimeTimePeriodValue,
          ),
          DoughnutChartBox(
            data: itemCONTRIBInRevenuesPoints,
            title: 'ITEM CONTRIB IN REVENUES',
            onChanged: (value) {
              setState(() {
                itemCONTRIBInRevenuesTimePeriodValue = value;
                getItemCONTRIBInRevenuesData = true;
              });
            },
            timePeriod: itemCONTRIBInRevenuesTimePeriodValue,
          ),
          BarChartBox(
            data: worstItemByRevenuesPoints,
            title: 'WORST ITEMS BY REVENUES',
            onChanged: (value) {
              setState(() {
                worstItemByRevenuesTimePeriodValue = value;
                getWorstItemByRevenuesData = true;
              });
            },
            // value: 0,
            // valuePostfix: '',
            // isUp: true,
            // isMoney: true,
            timePeriod: worstItemByRevenuesTimePeriodValue,
          ),
        ],
      ),
    );
  }
}
