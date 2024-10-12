import 'package:weather_news_aggregator/generated/json/current_weather.g.dart';

import 'package:weather_news_aggregator/generated/json/base/json_field.dart';
import 'package:weather_news_aggregator/model/condition.dart';

@JsonSerializable()
class CurrentWeather {

	CurrentWeather();

	factory CurrentWeather.fromJson(Map<String, dynamic> json) => $CurrentWeatherFromJson(json);

	Map<String, dynamic> toJson() => $CurrentWeatherToJson(this);

  @JSONField(name:"last_updated")
  String? lastUpdated;
  @JSONField(name:"temp_c")
  double? temp_c;
  @JSONField(name:"temp_f")
  double? temp_f;
  @JSONField(name:"wind_mph")
  double? wind_mph;
  @JSONField(name:"wind_kph")
  double? wind_kph;
  @JSONField(name:"wind_degree")
  double? wind_degree;
  @JSONField(name:"wind_dir")
  String? wind_dir;
  @JSONField(name:"pressure_mb")
  double? pressure_mb;
  @JSONField(name:"pressure_in")
  double? pressure_in;
  @JSONField(name:"precip_mm")
  double? precip_mm;
  @JSONField(name:"precip_in")
  double? precip_in;
  @JSONField(name:"humidity")
  double? humidity;
  @JSONField(name:"cloud")
  double? cloud;
  @JSONField(name:"uv")
  double? uv;
  @JSONField(name:"condition")
  Condition? condition;
}
