import 'package:flutter/material.dart';

const kBorderRaduis = 15.0;

double kMinDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width < 768 ? double.infinity : 768;
}
