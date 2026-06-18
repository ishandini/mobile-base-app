import 'package:flutter/material.dart';

class LanguageHelper {
  static bool isRTL(BuildContext context) {
    return false;
  }

  static TextDirection textDirection(BuildContext context) {
    return isRTL(context) ? TextDirection.rtl : TextDirection.ltr;
  }

  static TextAlign textAlign(BuildContext context) {
    return isRTL(context) ? TextAlign.right : TextAlign.left;
  }
}
