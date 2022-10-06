import 'package:flutter/material.dart';

import '../constants.dart';

class BIASText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const BIASText(
    this.text, {
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? kBIASDarkGrayColor,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: 'Poppins',
      ),
    );
  }
}
