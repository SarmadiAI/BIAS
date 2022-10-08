import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../bias_text.dart';
import '../current_state.dart';
import 'chart_data.dart';

class CardBox extends StatefulWidget {
  final List<ChartData> data;
  final String title;
  final double value;
  final bool isUp;
  final bool isMoney;
  final String timePeriod;
  final String valuePostfix;

  const CardBox({
    required this.data,
    required this.title,
    required this.value,
    required this.isUp,
    required this.isMoney,
    required this.timePeriod,
    required this.valuePostfix,
  });

  @override
  State<CardBox> createState() => _CardBoxState();
}

class _CardBoxState extends State<CardBox> {
  List<String> timePeriods = ['Day', 'Week', 'Month', 'Year', 'Choose Date'];
  late String timePeriodValue = timePeriods[0];
  @override
  Widget build(BuildContext context) {
    double _numberHeight = MediaQuery.of(context).size.width / 10;
    double percentage = 12.7;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 9 + _numberHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   image: AssetImage('assets/images/bg_1.png'),
          //   fit: BoxFit.cover,
          //   alignment: Alignment.topCenter,
          // ),
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
                  left: 20.0, right: 20, top: 23, bottom: 0),
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
                            setState(() async {
                              timePeriodValue = value!;
                              if (timePeriodValue == timePeriods[4]) {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101),
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        primaryColor:
                                            kBIASBlueColor.withOpacity(0.9),
                                        colorScheme: ColorScheme.light(
                                            primary: kBIASBlueColor
                                                .withOpacity(0.9)),
                                        buttonTheme: const ButtonThemeData(
                                            textTheme: ButtonTextTheme.primary),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);

                                  setState(() {
                                    timePeriods[4] = formattedDate;
                                    timePeriodValue = formattedDate;
                                  });
                                }
                              }
                            });
                          },
                          items: timePeriods.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        BIASText(
                          '${widget.value}',
                          fontSize: MediaQuery.of(context).size.width / 10,
                          fontWeight: FontWeight.w400,
                        ),
                        Visibility(
                          visible: widget.isMoney,
                          child: BIASText(
                            widget.valuePostfix,
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    currentState(isUp: widget.isUp, percentage: percentage),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
