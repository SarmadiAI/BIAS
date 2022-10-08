import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../screens/charts_test.dart';
import 'chart_data.dart';
import 'doughnut_chart_box.dart';

class DoughnutChart extends StatelessWidget {
  const DoughnutChart({
    required this.widget,
  });

  final DoughnutChartBox widget;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CircularSeries<ChartData, String>>[
        DoughnutSeries<ChartData, String>(
          dataSource: widget.data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y[0],
          dataLabelMapper: (ChartData data, _) => data.text,
          name: widget.title,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
