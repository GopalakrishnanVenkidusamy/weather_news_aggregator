import 'dart:developer';
import 'package:weather_news_aggregator/path_export.dart';

class Logger {
  static debug(String title, [dynamic message]) {
    if (kDebugMode) {
      if (message != null) {
        log("$title -> $message");
      } else {
        log(title);
      }
    }
  }

  static error(Object error) {
    log(error.toString());
  }
}