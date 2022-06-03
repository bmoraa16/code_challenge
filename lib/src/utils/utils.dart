import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static moveToNextScreen(BuildContext context, String page) {
    Navigator.pushReplacementNamed(context, page);
  }

  static Size getSizeScreen(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getHeightScreen(BuildContext context) {
    return getSizeScreen(context).height;
  }

  static getWidthScreen(BuildContext context) {
    return getSizeScreen(context).width;
  }

  static String readTimestamp(int timestamp) {
    
    var format = DateFormat('yyyy-MM-dd');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    
    var time = '';
    time = format.format(date);

    return time;
  }
}
