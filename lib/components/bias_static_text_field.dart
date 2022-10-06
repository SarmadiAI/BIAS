import 'dart:io';

import 'package:bias/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_border.dart';

class BIASStaticTextField extends StatefulWidget {
  final String labelText;
  final String? innerText;

  const BIASStaticTextField({
    required this.labelText,
    this.innerText,
  });

  @override
  State<BIASStaticTextField> createState() => _BIASStaticTextFieldState();
}

class _BIASStaticTextFieldState extends State<BIASStaticTextField> {
  late bool colorVisibility;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.innerText ?? '');
    colorVisibility = controller.text != '';
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (isFocus) {
          if (isFocus && !colorVisibility) {
            controller.text = 'Not Filled';
          } else if (!colorVisibility) {
            controller.text = '';
          }
        },
        child: TextField(
          controller: controller,
          readOnly: true,
          style: TextStyle(
            color: colorVisibility
                ? kBIASDarkGrayColor
                : kBIASLightGrayColor.withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
          cursorColor: kBIASBlueColor,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
            labelText: this.widget.labelText,
            labelStyle: TextStyle(
              color: colorVisibility
                  ? kBIASBlueColor
                  : kBIASLightGrayColor.withOpacity(0.7),
              fontSize: colorVisibility ? 16 : 13,
              fontWeight: colorVisibility ? FontWeight.w500 : FontWeight.w400,
              fontFamily: 'Poppins',
            ),
            border: inputBorder(),
            enabledBorder: inputBorder(),
            focusedBorder: inputBorder(),
          ),
        ),
      ),
    );
  }
}
