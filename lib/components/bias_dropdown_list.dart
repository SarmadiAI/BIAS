import 'package:bias/constants.dart';
import 'package:flutter/material.dart';

import 'input_border.dart';

class BIASDropdownList extends StatefulWidget {
  final String labelText;
  final List<String> list;
  final String? controller;
  final Function onChange;

  const BIASDropdownList(
      {super.key,
      required this.labelText,
      required this.list,
      required this.controller,
      required this.onChange});

  @override
  State<BIASDropdownList> createState() => _BIASDropdownListState();
}

class _BIASDropdownListState extends State<BIASDropdownList> {
  bool colorVisibility = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      colorVisibility = widget.controller != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (isFocus) {
          setState(() {
            colorVisibility = true;
          });
        },
        child: InputDecorator(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
            prefixIconColor: kBIASRedColor,
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
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              style: TextStyle(
                color: colorVisibility
                    ? kBIASDarkGrayColor
                    : kBIASLightGrayColor.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
              value: widget.controller,
              isDense: true,
              icon: Icon(
                Icons.expand_more,
                color: colorVisibility
                    ? kBIASDarkGrayColor
                    : kBIASLightGrayColor.withOpacity(0.7),
              ),
              onChanged: (value) {
                widget.onChange(value);
              },
              items: widget.list.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
