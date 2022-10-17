import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:http/http.dart' as http;

class ProfitsDashboardScreen extends StatefulWidget {
  const ProfitsDashboardScreen({Key? key}) : super(key: key);
  static const String id = 'profits_dashboard_screen';

  @override
  _ProfitsDashboardScreenState createState() => _ProfitsDashboardScreenState();
}

class _ProfitsDashboardScreenState extends State<ProfitsDashboardScreen> {
  String profitsPerTimeTimePeriodValue = 'Week';

  bool getProfitsPerTimeData = false;

  void getSalesPerTimePeriodPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_statistics_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'profits',
              'period': profitsPerTimeTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        ProfitsPerTimePeriodPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          ProfitsPerTimePeriodPoints.add(ChartData(key, [data[key] ?? 0], key));
        }
        setState(() {
          if (profitsPerTimeTimePeriodValue == 'Week' ||
              profitsPerTimeTimePeriodValue == 'Month') {
            ProfitsPerTimePeriodPoints =
                ProfitsPerTimePeriodPoints.reversed.toList();
          } else {
            ProfitsPerTimePeriodPoints = ProfitsPerTimePeriodPoints;
          }
        });
      }
    });
  }

  List<ChartData> ProfitsPerTimePeriodPoints = [];

  String worstItemByProfitsTimePeriodValue = 'Week';

  bool getWorstItemByProfitsData = false;

  void getWorstItemBySalesPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_item_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'profits',
              'period': worstItemByProfitsTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        worstItemByProfitsPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          worstItemByProfitsPoints.add(ChartData(key, [data[key]], key));
        }
        setState(() {
          if (profitsPerTimeTimePeriodValue == 'Week' ||
              profitsPerTimeTimePeriodValue == 'Month') {
            worstItemByProfitsPoints =
                worstItemByProfitsPoints.reversed.toList();
          } else {
            worstItemByProfitsPoints = worstItemByProfitsPoints;
          }
        });
      }
    });
  }

  List<ChartData> worstItemByProfitsPoints = [];

  String itemCONTRIBInProfitsTimePeriodValue = 'Week';

  bool getItemCONTRIBInProfitsData = false;

  void getItemCONTRIBInSalesPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_item_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'profits',
              'period': itemCONTRIBInProfitsTimePeriodValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        itemCONTRIBInProfitsPoints = [];
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          itemCONTRIBInProfitsPoints.add(ChartData(key, [data[key]], key));
        }
        setState(() {
          if (profitsPerTimeTimePeriodValue == 'Week' ||
              profitsPerTimeTimePeriodValue == 'Month') {
            itemCONTRIBInProfitsPoints =
                itemCONTRIBInProfitsPoints.reversed.toList();
          } else {
            itemCONTRIBInProfitsPoints = itemCONTRIBInProfitsPoints;
          }
        });
      }
    });
  }

  List<ChartData> itemCONTRIBInProfitsPoints = [];

  String profitsPerTimeTimePeriodCardValue = 'Week';

  bool getProfitsPerTimeCardData = false;

  void getSalesPerTimePeriodCardPoints() async {
    http
        .post(
            Uri.parse(
                'http://bias-env.eba-hcsnfmdq.us-east-1.elasticbeanstalk.com/insights/statistics_base_on_statistics_category/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8'
            },
            body: jsonEncode({
              'statistics_type': 'profits',
              'period': profitsPerTimeTimePeriodCardValue,
              'stock_list': [5, 6]
            }))
        .then((value) {
      if (value.statusCode == 200) {
        profitsPerTimePeriodValue = 0;
        Map data = jsonDecode(value.body);
        for (String key in data.keys) {
          profitsPerTimePeriodValue += data[key] ?? 0;
        }
        setState(() {
          profitsPerTimePeriodValue;
        });
      }
    });
  }

  double profitsPerTimePeriodValue = 0;

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
              'statistics_type': 'profits',
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
    if (getProfitsPerTimeData) {
      getSalesPerTimePeriodPoints();
      getProfitsPerTimeData = false;
    }
    if (getWorstItemByProfitsData) {
      getWorstItemBySalesPoints();
      getWorstItemByProfitsData = false;
    }
    if (getItemCONTRIBInProfitsData) {
      getItemCONTRIBInSalesPoints();
      getItemCONTRIBInProfitsData = false;
    }
    if (getProfitsPerTimeCardData) {
      getSalesPerTimePeriodCardPoints();
      getProfitsPerTimeCardData = false;
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
                  title: 'Profits PER TIME PERIOD',
                  value: profitsPerTimePeriodValue,
                  valuePostfix: 'JOD',
                  onChanged: (value) {
                    setState(() {
                      profitsPerTimeTimePeriodCardValue = value;
                      getProfitsPerTimeCardData = true;
                    });
                  },
                  // isUp: true,
                  isMoney: true,
                  timePeriod: profitsPerTimeTimePeriodCardValue,
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
            data: ProfitsPerTimePeriodPoints,
            title: 'Profits PER TIME PERIOD',
            onChanged: (value) {
              setState(() {
                profitsPerTimeTimePeriodValue = value;
                getProfitsPerTimeData = true;
              });
            },
            // value: 82.350,
            // valuePostfix: 'JOD',
            // isUp: true,
            // isMoney: true,
            timePeriod: profitsPerTimeTimePeriodValue,
          ),
          DoughnutChartBox(
            data: itemCONTRIBInProfitsPoints,
            title: 'ITEM CONTRIB IN Profits',
            onChanged: (value) {
              setState(() {
                itemCONTRIBInProfitsTimePeriodValue = value;
                getItemCONTRIBInProfitsData = true;
              });
            },
            timePeriod: itemCONTRIBInProfitsTimePeriodValue,
          ),
          BarChartBox(
            data: worstItemByProfitsPoints,
            title: 'WORST ITEMS BY Profits',
            onChanged: (value) {
              setState(() {
                worstItemByProfitsTimePeriodValue = value;
                getWorstItemByProfitsData = true;
              });
            },
            // value: 0,
            // valuePostfix: '',
            // isUp: true,
            // isMoney: true,
            timePeriod: worstItemByProfitsTimePeriodValue,
          ),
        ],
      ),
    );
  }
}
