// import 'package:bias/components/charts/column_chart.dart';
// import 'package:bias/main.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
// import '../components/bias_heading.dart';
// import '../components/bias_text.dart';
// import '../components/charts/card_box.dart';
// import '../components/charts/chart_data.dart';
// import '../components/charts/column_chart_box.dart';
// import '../components/charts/doughnut_chart.dart';
// import '../components/charts/doughnut_chart_box.dart';
// import '../components/charts/line_chart.dart';
// import '../components/charts/line_chart_box.dart';
// import '../constants.dart';
// import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
//
// class ChartsTest extends StatefulWidget {
//   const ChartsTest({Key? key}) : super(key: key);
//   static const String id = "charts_test";
//
//   @override
//   _ChartsTestState createState() => _ChartsTestState();
// }
//
// class _ChartsTestState extends State<ChartsTest> {
//   List<ChartData> data = [
//     ChartData('24 Sep - Sat', [9], 'one'),
//     ChartData('25 Sep - Sun', [24], 'two'),
//     ChartData('26 Sep - Mon', [34], 'three'),
//     ChartData('27 Sep - Tue', [13], 'four'),
//     ChartData('28 Sep - Wed', [30], 'five'),
//     ChartData('29 Sep - Thu', [45], 'six'),
//     ChartData('30 Sep - Fri', [11], 'seven')
//   ];
//   @override
//   Widget build(BuildContext context) {
//     // List of items in our dropdown menu
//     List<String> _timePeriodsList = [
//       'Day',
//       'Week',
//       'Month',
//     ];
//     String dropdownValue = _timePeriodsList[0];
//
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           color: CupertinoColors.extraLightBackgroundGray,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 height: 100,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 20.0, vertical: 10),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const BIASHeading('Revenue Dashboard'),
//                           InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Icon(
//                               CupertinoIcons.arrow_right,
//                               color: kBIASDarkGrayColor,
//                               size: 28,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     LineChartBox(
//                       data: data,
//                       title: 'REVENUE',
//                       // value: 82.350,
//                       // valuePostfix: 'JOD',
//                       // isUp: true,
//                       // isMoney: true,
//                       timePeriod: 'm',
//                     ),
//                     ColumnChartBox(
//                       data: data,
//                       title: 'REVENUE',
//                       value: 82.350,
//                       valuePostfix: 'JOD',
//                       isUp: true,
//                       isMoney: true,
//                       timePeriod: 'm',
//                     ),
//                     DoughnutChartBox(
//                       data: data,
//                       title: 'REVENUE',
//                       value: 82.350,
//                       valuePostfix: 'JOD',
//                       isUp: true,
//                       isMoney: true,
//                       timePeriod: 'm',
//                     ),
//                     CardBox(
//                       data: data,
//                       title: 'REVENUE',
//                       value: 82.350,
//                       valuePostfix: 'JOD',
//                       isUp: true,
//                       isMoney: true,
//                       timePeriod: 'm',
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
