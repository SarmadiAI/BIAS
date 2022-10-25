import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'chart_data.dart';
import 'column_chart_box.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({
    super.key,
    required this.widget,
  });

  final ColumnChartBox widget;

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
        ColumnSeries<ChartData, String>(
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
