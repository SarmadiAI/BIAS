import 'dart:convert';
import 'package:bias/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_border.dart';

class BIASStaticImageField extends StatefulWidget {
  final String labelText;
  final String? image;

  const BIASStaticImageField({
    super.key,
    required this.labelText,
    this.image,
  });

  @override
  State<BIASStaticImageField> createState() => _BIASStaticImageFieldState();
}

class _BIASStaticImageFieldState extends State<BIASStaticImageField> {
  late bool colorVisibility;

  @override
  void initState() {
    super.initState();
    colorVisibility = (widget.image ?? false) == false ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
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
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: MediaQuery.of(context).size.width - 50,
        decoration: widget.image == null || widget.image == ''
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white)
            : BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: Image.memory(base64Decode(widget.image!)).image,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
        child: widget.image == null || widget.image == ''
            ? Icon(
                CupertinoIcons.photo,
                color: kBIASLightGrayColor.withOpacity(0.7),
                size: 50,
              )
            : Container(),
      ),
    );
  }
}
