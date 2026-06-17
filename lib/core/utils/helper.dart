import 'dart:convert';

import 'package:dart_date/dart_date.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/core/constants/date_const.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  Helper._internal();

  static final Helper _instance = Helper._internal();

  factory Helper() => _instance;

  Future<dynamic> loadLocalJsonData({required String path}) async {
    final data = await rootBundle.loadString(path);
    final jsonResult = json.decode(data);
    return jsonResult;
  }

  String getStringDateNow(String format) {
    return DateTime.now().format(format);
  }

  String getDateFromTimeStamp(int? timestamp, String pattern) {
    if (timestamp == null) return '';
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final formattedDate = DateFormat(pattern).format(date);
    return formattedDate;
  }

  bool isDateInRange(
      {required DateTime start, required DateTime end, String? dateTime}) {
    if (dateTime == null) return false;
    final DateTime dt = getDateTime24(dateTime);

    return dt.isAfter(start) && dt.isBefore(end);
  }

  DateTime getDateTime24(String dateTime) {
    return DateTimeExtension.parse(dateTime,
        pattern: DateConst.ddMMMYyyyDashHHmmssDot);
  }

  static Future<void> launchPhoneCall(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
