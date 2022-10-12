import 'package:flutter/material.dart';

import 'up_state.dart';

import 'down_state.dart';

Widget currentState({required bool isUp, required double percentage}) {
  if (isUp) {
    return UpState(percentage: percentage);
  } else {
    return DownState(percentage: percentage);
  }
}
