import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SearchTextField extends StatelessWidget {
  final void Function(String)? onChanged;

  const SearchTextField({
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(
          color: kBIASDarkGrayColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(14, 16, 16, 16),
            child: Icon(
              Icons.search,
              color: kBIASLightGrayColor,
            ),
          ),
          prefixIconConstraints: BoxConstraints(),
          enabled: true,
          filled: true,
          fillColor: CupertinoColors.extraLightBackgroundGray,
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          border: searchOutlineInputBorder(),
          enabledBorder: searchOutlineInputBorder(),
          focusedBorder: searchOutlineInputBorder(),
          hintText: 'Search for products',
          hintStyle: TextStyle(
            color: kBIASLightGrayColor,
            fontSize: 14,
            fontWeight: FontWeight.w300,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder searchOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide(
      style: BorderStyle.none,
    ),
  );
}
