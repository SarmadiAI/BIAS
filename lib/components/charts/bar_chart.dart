import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'bar_chart_box.dart';
import 'chart_data.dart';

class BarChart extends StatelessWidget {
  const BarChart({
    super.key,
    required this.widget,
  });

  final BarChartBox widget;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        rangePadding: ChartRangePadding.additional,
        isVisible: false,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<ChartData, String>>[
        BarSeries<ChartData, String>(
          dataSource: widget.data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y[0],
          name: widget.title,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
