import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/const.dart';

class LanguageHelper {
  static bool isRTL(BuildContext context) {
    return Localizations.localeOf(context).languageCode == Const.languageTa;
  }

  static TextDirection textDirection(BuildContext context) {
    return isRTL(context) ? TextDirection.rtl : TextDirection.ltr;
  }

  static TextAlign textAlign(BuildContext context) {
    return isRTL(context) ? TextAlign.right : TextAlign.left;
  }
}
