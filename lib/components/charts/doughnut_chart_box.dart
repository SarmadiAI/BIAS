import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../bias_text.dart';
import 'chart_data.dart';
import 'doughnut_chart.dart';

class DoughnutChartBox extends StatefulWidget {
  final List<ChartData> data;
  final String title;
  final Function onChanged;
  // final double value;
  // final bool isUp;
  // final bool isMoney;
  final String timePeriod;
  // final String valuePostfix;

  const DoughnutChartBox({
    super.key,
    required this.data,
    required this.title,
    required this.onChanged,
    // required this.value,
    // required this.isUp,
    // required this.isMoney,
    required this.timePeriod,
    // required this.valuePostfix,
  });

  @override
  State<DoughnutChartBox> createState() => _DoughnutChartBoxState();
}

class _DoughnutChartBoxState extends State<DoughnutChartBox> {
  List<String> timePeriods = ['Day', 'Week', 'Month', 'Year', 'Choose Date'];
  late String timePeriodValue = widget.timePeriod;
  @override
  Widget build(BuildContext context) {
    double _numberHeight = MediaQuery.of(context).size.width / 10;
    double percentage = 12.7;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3 + _numberHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7, // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 23, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BIASText(
                    widget.title,
                    color: kBIASLightGrayColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                  FocusScope(
                    child: Focus(
                      onFocusChange: (isFocus) {
                        setState(() {});
                      },
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          style: TextStyle(
                            color: kBIASDarkGrayColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                          icon: Icon(
                            CupertinoIcons.ellipsis,
                            color: Colors.white,
                          ),
                          value: timePeriodValue,
                          isDense: true,
                          onChanged: (value) {
                            setState(() {
                              timePeriodValue = value!;
                            });
                            widget.onChanged(value);
                            // if (timePeriodValue == timePeriods[4]) {
                            //   DateTime? pickedDate = await showDatePicker(
                            //     context: context,
                            //     initialDate: DateTime.now(),
                            //     firstDate: DateTime(
                            //         2000), //DateTime.now() - not to allow to choose before today.
                            //     lastDate: DateTime(2101),
                            //     builder: (context, child) {
                            //       return Theme(
                            //         data: ThemeData.light().copyWith(
                            //           primaryColor:
                            //               kBIASBlueColor.withOpacity(0.9),
                            //           colorScheme: ColorScheme.light(
                            //               primary: kBIASBlueColor
                            //                   .withOpacity(0.9)),
                            //           buttonTheme: const ButtonThemeData(
                            //               textTheme: ButtonTextTheme.primary),
                            //         ),
                            //         child: child!,
                            //       );
                            //     },
                            //   );
                            //
                            //   if (pickedDate != null) {
                            //     String formattedDate =
                            //         DateFormat('yyyy-MM-dd')
                            //             .format(pickedDate);
                            //
                            //     setState(() {
                            //       timePeriods[4] = formattedDate;
                            //       timePeriodValue = formattedDate;
                            //     });
                            //   }
                            // }
                          },
                          items: timePeriods.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: BIASText(value, fontSize: 13),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DoughnutChart(widget: widget),
            ),
          ],
        ),
      ),
    );
  }
}
