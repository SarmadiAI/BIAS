import 'package:flutter/material.dart';

import '../constants.dart';
import 'bias_text.dart';

class DownState extends StatelessWidget {
  final double percentage;

  const DownState({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
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
