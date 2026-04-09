import 'package:flutter/material.dart';

class Responsive {
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 700;
  static double maxContentWidth(BuildContext context) => isTablet(context) ? 760 : 520;
}
