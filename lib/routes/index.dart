import 'package:weather_news_aggregator/path_export.dart';

class PageRoutes{
  static const String home = "/home";

  defaultRoute() {
    return home;
  }
  Map<String, WidgetBuilder> routes() {
    return {
      home: (context) =>  const HomePage(),
    };
  }
}