import 'package:bias/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_border.dart';

class BIASTextField extends StatefulWidget {
  final String labelText;
  final bool? obscureText;
  final bool? isIntegerNumber;
  final bool? isFloatNumber;
  final String? innerText;
  final TextEditingController controller;

  const BIASTextField({
    super.key,
    required this.labelText,
    this.obscureText,
    this.isIntegerNumber,
    this.isFloatNumber,
    this.innerText,
    required this.controller,
  });

  @override
  State<BIASTextField> createState() => _BIASTextFieldState();
}

class _BIASTextFieldState extends State<BIASTextField> {
  late bool colorVisibility;

  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.innerText ?? '';
    colorVisibility = widget.innerText != '';
    setState(() {
      if (widget.controller.text == '') {
        colorVisibility = false;
      } else {
        colorVisibility = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (isFocus) {
          setState(() {
            if (widget.controller.text == '') {
              colorVisibility = false;
            } else {
              colorVisibility = true;
            }
          });
        },
        child: TextField(
          controller: widget.controller,
          keyboardType: ((widget.isFloatNumber ?? false) ||
                  (widget.isIntegerNumber ?? false))
              ? TextInputType.number
              : null,
          inputFormatters: (widget.isFloatNumber ?? false)
              ? [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'([0-9]+([.][0-9]*)?|[.][0-9]+)'))
                ]
              : (widget.isIntegerNumber ?? false)
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
          style: const TextStyle(
            color: kBIASDarkGrayColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
          cursorColor: kBIASBlueColor,
          onChanged: (value) {
            setState(() {
              if (value == '') {
                colorVisibility = false;
              } else {
                colorVisibility = true;
              }
            });
          },
          obscureText: widget.obscureText ?? false,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: colorVisibility
                  ? kBIASBlueColor
                  : kBIASLightGrayColor.withOpacity(0.7),
              fontSize: colorVisibility ? 16 : 13,
              fontWeight: colorVisibility ? FontWeight.w500 : FontWeight.w400,
              fontFamily: 'Poppins',
            ),
            border: inputBorder(), //normal border
            enabledBorder: inputBorder(), //enabled border
            focusedBorder: inputBorder(), //focused border
          ),
        ),
      ),
    );
  }
}
