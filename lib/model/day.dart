import 'package:weather_news_aggregator/generated/json/day.g.dart';

import 'package:weather_news_aggregator/generated/json/base/json_field.dart';
import 'package:weather_news_aggregator/model/condition.dart';

@JsonSerializable()
class Day {

	Day();

	factory Day.fromJson(Map<String, dynamic> json) => $DayFromJson(json);

	Map<String, dynamic> toJson() => $DayToJson(this);

  @JSONField(name:"maxtemp_c")
  double? maxTempC;
  @JSONField(name:"mintemp_c")
  double? minTempC;
  @JSONField(name:"mintemp_f")
  double? minTempF;
  @JSONField(name:"maxtemp_f")
  double? maxTempF;
  @JSONField(name:"condition")
  Condition? condition;
}
