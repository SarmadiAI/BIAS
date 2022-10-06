import 'package:bias/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_border.dart';

class BIASDropdownList extends StatefulWidget {
  final String labelText;
  final List<String> list;

  const BIASDropdownList({required this.labelText, required this.list});

  @override
  State<BIASDropdownList> createState() => _BIASDropdownListState();
}

class _BIASDropdownListState extends State<BIASDropdownList> {
  bool colorVisibility = false;
  late String _currentSelectedValue = widget.list[0];

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
            labelText: this.widget.labelText,
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
              value: _currentSelectedValue,
              isDense: true,
              icon: Icon(
                Icons.expand_more,
                color: colorVisibility
                    ? kBIASDarkGrayColor
                    : kBIASLightGrayColor.withOpacity(0.7),
              ),
              onChanged: (newValue) {
                setState(() {
                  _currentSelectedValue = newValue!;
                });
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
