import 'package:weather_news_aggregator/generated/json/forecastday.g.dart';

import 'package:weather_news_aggregator/generated/json/base/json_field.dart';
import 'package:weather_news_aggregator/model/day.dart';

@JsonSerializable()
class ForecastDay {

	ForecastDay();

	factory ForecastDay.fromJson(Map<String, dynamic> json) => $ForecastDayFromJson(json);

	Map<String, dynamic> toJson() => $ForecastDayToJson(this);

  @JSONField(name: "date")
  String? date;
  @JSONField(name: "day")
  Day? day;
}