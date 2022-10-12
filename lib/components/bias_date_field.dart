import 'package:bias/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'input_border.dart';

class BIASDateField extends StatefulWidget {
  final String labelText;
  final bool? readOnly;
  final TextEditingController controller;
  const BIASDateField({
    super.key,
    required this.labelText,
    this.readOnly,
    required this.controller,
  });

  @override
  State<BIASDateField> createState() => _BIASDateFieldState();
}

class _BIASDateFieldState extends State<BIASDateField> {
  bool colorVisibility = false;

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
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
          controller: widget.controller,
          readOnly: true,
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
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    2000), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      primaryColor: kBIASBlueColor.withOpacity(0.9),
                      colorScheme: ColorScheme.light(
                          primary: kBIASBlueColor.withOpacity(0.9)),
                      buttonTheme: const ButtonThemeData(
                          textTheme: ButtonTextTheme.primary),
                    ),
                    child: child!,
                  );
                });

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);

              setState(() {
                widget.controller.text = formattedDate;
              });
            }
          },
        ),
      ),
    );
  }
}
