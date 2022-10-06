import 'package:bias/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../components/bias_text.dart';
import '../constants.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class ChartsTest extends StatefulWidget {
  const ChartsTest({Key? key}) : super(key: key);
  static const String id = "charts_test";

  @override
  _ChartsTestState createState() => _ChartsTestState();
}

class _ChartsTestState extends State<ChartsTest> {
  List<_Data> data = [
    _Data('24 Sep - Sat', [9]),
    _Data('25 Sep - Sun', [24]),
    _Data('26 Sep - Mon', [34]),
    _Data('27 Sep - Tue', [13]),
    _Data('28 Sep - Wed', [30]),
    _Data('29 Sep - Thu', [45]),
    _Data('30 Sep - Fri', [11])
  ];
  @override
  Widget build(BuildContext context) {
    // List of items in our dropdown menu
    List<String> _timePeriodsList = [
      'Day',
      'Week',
      'Month',
    ];
    String dropdownValue = _timePeriodsList[0];

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: CupertinoColors.extraLightBackgroundGray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    ChartBox(
                      data: data,
                      title: 'REVENUE',
                      value: 82.350,
                      valuePostfix: 'JOD',
                      isUp: true,
                      isMoney: true,
                      timePeriod: 'm',
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
}

class FilterBox extends StatelessWidget {
  final Widget child;
  final Color? tabColor;

  const FilterBox({
    required this.child,
    this.tabColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(
            color: tabColor ?? CupertinoColors.extraLightBackgroundGray,
            width: 2),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

class ChartBox extends StatefulWidget {
  final List<_Data> data;
  final String title;
  final double value;
  final bool isUp;
  final bool isMoney;
  final String timePeriod;
  final String valuePostfix;

  const ChartBox({
    required this.data,
    required this.title,
    required this.value,
    required this.isUp,
    required this.isMoney,
    required this.timePeriod,
    required this.valuePostfix,
  });

  @override
  State<ChartBox> createState() => _ChartBoxState();
}

class _ChartBoxState extends State<ChartBox> {
  int _tabIndexSelected = 0;
  List<Color> _toggleTabColor = [
    kBIASBlueColor,
    kBIASLightGrayColor,
    kBIASLightGrayColor,
    kBIASLightGrayColor,
    kBIASLightGrayColor,
  ];
  List<Color> _toggleTabBackgroundColor = [
    kBIASBlueColor.withOpacity(0.3),
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    double _numberHeight = MediaQuery.of(context).size.width / 10;
    double percentage = 12.7;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2.25 + _numberHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/bg_1.png'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7, // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 23),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BIASText(
                        widget.title,
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      Icon(CupertinoIcons.ellipsis, color: kBIASLightGrayColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              BIASText(
                                '${widget.value}',
                                fontSize:
                                    MediaQuery.of(context).size.width / 10,
                                fontWeight: FontWeight.w400,
                              ),
                              Visibility(
                                visible: widget.isMoney,
                                child: BIASText(
                                  widget.valuePostfix,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          currentState(
                              isUp: widget.isUp, percentage: percentage),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 7, // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            ToggleTabBar(
                              child: BIASText(
                                'D',
                                color: _toggleTabColor[0],
                              ),
                              backgroundColor: _toggleTabBackgroundColor[0],
                              onTap: () {
                                changeTabColors(0);
                              },
                            ),
                            ToggleTabBar(
                              child: BIASText(
                                'W',
                                color: _toggleTabColor[1],
                              ),
                              backgroundColor: _toggleTabBackgroundColor[1],
                              onTap: () {
                                changeTabColors(1);
                              },
                            ),
                            ToggleTabBar(
                              child: BIASText(
                                'M',
                                color: _toggleTabColor[2],
                              ),
                              backgroundColor: _toggleTabBackgroundColor[2],
                              onTap: () {
                                changeTabColors(2);
                              },
                            ),
                            ToggleTabBar(
                              child: BIASText(
                                'Y',
                                color: _toggleTabColor[3],
                              ),
                              backgroundColor: _toggleTabBackgroundColor[3],
                              onTap: () {
                                changeTabColors(3);
                              },
                            ),
                            ToggleTabBar(
                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: _toggleTabColor[4],
                                size: 17,
                              ),
                              backgroundColor: _toggleTabBackgroundColor[4],
                              onTap: () {
                                setState(() {
                                  changeTabColors(4);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_Data, String>>[
                    LineSeries<_Data, String>(
                      dataSource: widget.data,
                      xValueMapper: (_Data sales, _) => sales.x,
                      yValueMapper: (_Data sales, _) => sales.y[0],
                      name: 'Revenue',
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeTabColors(int index) {
    for (int i = 0; i < 5; i++) {
      _toggleTabColor[i] = kBIASLightGrayColor;
      _toggleTabBackgroundColor[i] = Colors.white;
    }
    _toggleTabColor[index] = kBIASBlueColor;
    _toggleTabBackgroundColor[index] = kBIASBlueColor.withOpacity(0.3);
  }
}

class ToggleTabBar extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final void Function()? onTap;

  const ToggleTabBar({
    required this.child,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? kBIASBlueColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}

Widget currentState({required bool isUp, required double percentage}) {
  if (isUp) {
    return UpState(percentage: percentage);
  } else {
    return DownState(percentage: percentage);
  }
}

class UpState extends StatelessWidget {
  final double percentage;

  const UpState({
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.arrow_upward_outlined,
          color: kBIASGreenColor,
          size: 15,
        ),
        BIASText(
          '$percentage%',
          color: kBIASGreenColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}

class DownState extends StatelessWidget {
  final double percentage;

  const DownState({
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.arrow_downward_outlined,
          color: kBIASRedColor,
          size: 15,
        ),
        BIASText(
          '$percentage%',
          color: kBIASRedColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}

class _Data {
  _Data(this.x, this.y);

  final String x;
  final List<double> y;
}
