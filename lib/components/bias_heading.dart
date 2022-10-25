import 'package:flutter/material.dart';

import 'bias_text.dart';

class BIASHeading extends StatelessWidget {
  final String heading;
  const BIASHeading(this.heading, {super.key});

  @override
  Widget build(BuildContext context) {
    return BIASText(
      heading,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }
}
