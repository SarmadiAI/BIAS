import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../screens/charts_test.dart';
import 'chart_data.dart';

class LineChart extends StatelessWidget {
  const LineChart({
    required this.widget,
  });

  final LineChartBox widget;

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
        LineSeries<ChartData, String>(
          dataSource: widget.data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y[0],
          name: widget.title,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
