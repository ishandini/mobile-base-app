import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/const.dart';
import 'package:flutter_app_template/core/constants/date_const.dart';
import 'package:flutter_app_template/core/utils/helper.dart';
import 'package:intl/intl.dart';

extension OptionalBoolExtension on bool? {
  bool get orTrue => this ?? true;
  bool get orFalse => this ?? false;
}

extension StringExtension on String {
  String toCurrency({bool isDecibleOmitted = false}) {
    if (isDecibleOmitted) {
      return NumberFormat('#,###')
          .format(double.tryParse(isEmpty ? '0' : this));
    }
    return NumberFormat('#,##0.00')
        .format(double.tryParse(isEmpty ? '0.00' : this));
  }

  String toAmount({bool showDecimals = false}) {
    return '${Const.currencyCode} ${toCurrency(isDecibleOmitted: !showDecimals)}';
  }

  String allWordsCapitilize() => splitMapJoin(RegExp(r'\w+'),
      onMatch: (m) =>
          '${m.group(0)}'.substring(0, 1).toUpperCase() +
          '${m.group(0)}'.substring(1).toLowerCase(),
      onNonMatch: (n) => ' ');

  String toCapitalized() => isNotEmpty
      ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
      : this;

  Color toColor() {
    return Color(
      int.parse(
        replaceAll('#', '0x'),
      ),
    );
  }

  int toInt() {
    if (trim() == '') return 0;
    return int.tryParse(this) ?? 0;
  }

  double toDouble() {
    final text = replaceAll(',', '');
    return double.tryParse(text) ?? 0;
  }

  DateTime toDateTimeObject(
      {String dateFormat = DateConst.ddMMMYyyyDashHHmmssDot}) {
    final format = DateFormat(dateFormat);
    final dateTime = format.parse(this);
    return dateTime;
  }

  String toDateTimeString(String format) {
    if (isEmpty) return '';
    final dt = Helper().getDateTime24(this);
    return dt.format(format);
  }

  String get digitsOnly => replaceAll(RegExp(r'\D'), '');

  String maskPhone() {
    if (length < 6) return this;
    return '${substring(0, length - 9)}*****${substring(length - 4)}';
  }

  bool get isValidEmail =>
      RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(trim());

  bool get isValidNic {
    bool validDay(int day) =>
        (day >= 1 && day <= 366) || (day >= 501 && day <= 866);

    if (RegExp(r'^\d{9}[VXvx]$').hasMatch(this)) {
      return validDay(int.tryParse(substring(2, 5)) ?? 0);
    }
    if (RegExp(r'^\d{12}$').hasMatch(this)) {
      return validDay(int.tryParse(substring(4, 7)) ?? 0);
    }
    return false;
  }

  String maskEmail() {
    final atIndex = indexOf('@');
    if (atIndex <= 1) return this;
    return '${this[0]}***${substring(atIndex)}';
  }
}

extension StringHtmlExtension on String {
  String stripHtml() {
    var text = replaceAll(RegExp(r'<li[^>]*>'), '\n • ');
    text = text.replaceAll('<p>', '\n');
    text = text.replaceAll('&nbsp;', ' ');
    text = text.replaceAll('&amp;', '&');
    text = text.replaceAll('&lt;', '<');
    text = text.replaceAll('&gt;', '>');
    text = text.replaceAll(RegExp(r'<[^>]*>'), '');
    return text.trim();
  }
}

extension OptionalStringExtension on String? {
  String toCurrency({bool isDecibleOmitted = false}) {
    final givenNum = (this ?? '').isEmpty ? '0' : this!;
    if (isDecibleOmitted) {
      return NumberFormat('#,###').format(double.tryParse(givenNum));
    }
    return NumberFormat('#,##0.00').format(double.tryParse(givenNum));
  }

  String toAmount({bool showDecimals = false}) {
    return '${Const.currencyCode} ${toCurrency(isDecibleOmitted: !showDecimals)}';
  }

  String toShortAmount() {
    final value = double.tryParse(this ?? '0') ?? 0;
    if (value == 0) return '${Const.currencyCode} 0';
    final millions = value / 1000000;
    final formatted = millions == millions.truncateToDouble()
        ? '${millions.truncate()}M'
        : '${millions.toStringAsFixed(1)}M';
    return '${Const.currencyCode} $formatted';
  }

  String toShortValue() {
    final value = double.tryParse(this ?? '0') ?? 0;
    if (value == 0) return '0';
    final millions = value / 1000000;
    return millions == millions.truncateToDouble()
        ? '${millions.truncate()}M'
        : '${millions.toStringAsFixed(1)}M';
  }

  String get orEmpty => this ?? '';

  String get orZero => this ?? '0';

  String get orZeroWithDecimal => this ?? '0.00';

  String get orDash {
    if (this == null) {
      return '-';
    } else {
      return this!.isEmpty ? '-' : this!;
    }
  }

  String get newLine {
    if (isNullOrEmpty) {
      return '';
    } else {
      return '$this \n';
    }
  }
}

extension ContextExtension on BuildContext {
  unfocus() {
    FocusScope.of(this).unfocus();
  }

  Future<void> showModal(
    Widget modal, {
    isScrollControlled = true,
    AnimationController? animationController,
    RouteSettings? routeSettings,
  }) {
    return showModalBottomSheet(
      context: this,
      backgroundColor: Colors.transparent,
      builder: (ctx) => GestureDetector(
        onTap: () => unfocus(),
        child: SafeArea(
          bottom: false,
          child: modal,
        ),
      ),
      isScrollControlled: isScrollControlled,
      transitionAnimationController: animationController,
      routeSettings: routeSettings,
    );
  }

  Future<void> showUndismissableModal(Widget modal) {
    return showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      context: this,
      backgroundColor: Colors.transparent,
      builder: (ctx) => SafeArea(
        bottom: false,
        child: modal,
      ),
      isScrollControlled: true,
    );
  }
}

extension GeneralObjectExtension on Object? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;

  bool get isNullOrEmpty =>
      isNull ||
      _isStringObjectEmpty ||
      _isIterableObjectEmpty ||
      _isMapObjectEmpty;

  bool get _isStringObjectEmpty =>
      (this is String) ? (this as String).isEmpty : false;

  bool get _isIterableObjectEmpty =>
      (this is Iterable) ? (this as Iterable).isEmpty : false;

  bool get _isMapObjectEmpty => (this is Map) ? (this as Map).isEmpty : false;
}
