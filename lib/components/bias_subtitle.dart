import 'package:flutter/material.dart';

import 'bias_text.dart';

class BIASSubtitle extends StatelessWidget {
  final String subtitle;

  BIASSubtitle(this.subtitle);

  @override
  Widget build(BuildContext context) {
    return BIASText(
      subtitle,
      fontSize: 13,
      fontWeight: FontWeight.w300,
    );
  }
}
