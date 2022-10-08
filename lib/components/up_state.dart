import 'package:flutter/material.dart';

import '../constants.dart';
import 'bias_text.dart';

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
