
import 'package:weather_news_aggregator/path_export.dart';

class CustomSnackBar {
  static showSnackBar(BuildContext context, String title) {
    hideSnackBar(context);
    final snackBar = SnackBar(
      content: Text(title),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}