import 'package:flutter/material.dart';

import 'bias_text.dart';

class BIASTitle extends StatelessWidget {
  final String title;

  const BIASTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return BIASText(
      title,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }
}
