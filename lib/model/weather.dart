import 'package:weather_news_aggregator/generated/json/weather.g.dart';

import 'package:weather_news_aggregator/generated/json/base/json_field.dart';
import 'package:weather_news_aggregator/model/current_weather.dart';
import 'package:weather_news_aggregator/model/forecast.dart';
import 'package:weather_news_aggregator/model/forecastday.dart';
import 'package:weather_news_aggregator/model/location.dart';

@JsonSerializable()
class Weather {

	Weather();

	factory Weather.fromJson(Map<String, dynamic> json) => $WeatherFromJson(json);

	Map<String, dynamic> toJson() => $WeatherToJson(this);

  @JSONField(name:"location")
  Location? location;
  @JSONField(name:"current")
  CurrentWeather? currentWeather;
  @JSONField(name:"forecast")
  Forecast? forecast;
}