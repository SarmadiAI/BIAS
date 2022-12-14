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

class RevenuesDashboardScreen extends StatefulWidget {
  const RevenuesDashboardScreen({Key? key}) : super(key: key);
  static const String id = 'revenues_dashboard_screen';

  @override
  _RevenuesDashboardScreenState createState() =>
      _RevenuesDashboardScreenState();
}

class _RevenuesDashboardScreenState extends State<RevenuesDashboardScreen> {
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

    return Expanded(
      child: ListView(
        children: [
          LineChartBox(
            data: data,
            title: 'REVENUES PER TIME PERIOD',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
          LineChartBox(
            data: data,
            title: 'REVENUES PER TIME PERIOD',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
          LineChartBox(
            data: data,
            title: 'REVENUES PER TIME PERIOD',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
          ColumnChartBox(
            data: data,
            title: 'REVENUES ON EACH DAY',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
          ColumnChartBox(
            data: data,
            title: 'REVENUES ON EACH HOUR',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
          BarChartBox(
            data: data,
            title: 'BEST ITEMS BY REVENUES',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
          BarChartBox(
            data: data,
            title: 'WORST ITEMS BY REVENUES',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
          DoughnutChartBox(
            data: data,
            title: 'ITEM CONTRIB IN REVS',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
          CardBox(
            data: data,
            title: 'REVENUES PER TIME PERIOD',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
          CardBox(
            data: data,
            title: 'AVG REVENUES',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
          CardBox(
            data: data,
            title: 'TOP ITEM BY REVENUES',
            value: 82.350,
            valuePostfix: 'JOD',
            isUp: true,
            isMoney: true,
            timePeriod: 'm',
          ),
        ],
      ),
    );
  }
}
