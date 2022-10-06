import 'package:flutter/material.dart';

import 'bias_text.dart';

class BIASHeading extends StatelessWidget {
  final String heading;
  const BIASHeading(this.heading);

  @override
  Widget build(BuildContext context) {
    return BIASText(
      heading,
      fontSize: 27,
      fontWeight: FontWeight.w600,
    );
  }
}
