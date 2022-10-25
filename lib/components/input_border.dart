import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

OutlineInputBorder inputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      color: CupertinoColors.extraLightBackgroundGray,
      width: 2,
    ),
  );
}
