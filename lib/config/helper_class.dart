import 'package:intl/intl.dart';
import 'package:weather_news_aggregator/path_export.dart';


class HelperClass{
  /// width < 768
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 768;

  /// width < 768
  /// Include Tablet & 13'' Laptop
  static bool isTab(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 768 &&
          MediaQuery.sizeOf(context).width <= 1024;

  static CurrentPlatform getCurrentPlatform(BuildContext context){
    if(isMobile(context)){
      return CurrentPlatform.mobile;
    }else if(isTab(context)){
      return CurrentPlatform.tab;
    }
    return CurrentPlatform.web;
  }

  /// Formats date and time to 'dd-MM-yyyy hh:mm a'. [Eg: 17-04-2024, 12:30pm]
  String formatDateTimeWithTime(String dateTime) {
    final DateTime parsedDateTime = DateTime.parse(dateTime);
    return DateFormat('dd-MM-yyyy hh:mm a').format(parsedDateTime);
  }

  /// Formats date to 'dd-MM-yyyy'. [Eg: 17-04-2024]
  String formatDateWithoutTime(String dateTime) {
    final DateTime parsedDateTime = DateTime.parse(dateTime);
    return DateFormat('dd-MM-yyyy').format(parsedDateTime);
  }

}