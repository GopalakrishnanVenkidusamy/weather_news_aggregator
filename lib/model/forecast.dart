import 'package:weather_news_aggregator/generated/json/base/json_field.dart';
import 'package:weather_news_aggregator/generated/json/forecast.g.dart';

import 'package:weather_news_aggregator/model/forecastday.dart';

@JsonSerializable()
class Forecast {

	Forecast();

	factory Forecast.fromJson(Map<String, dynamic> json) => $ForecastFromJson(json);

	Map<String, dynamic> toJson() => $ForecastToJson(this);

  @JSONField(name: "forecastday")
  List<ForecastDay>? forecastday;
}