import 'package:weather_news_aggregator/generated/json/condition.g.dart';

import 'package:weather_news_aggregator/generated/json/base/json_field.dart';

@JsonSerializable()
class Condition {

	Condition();

	factory Condition.fromJson(Map<String, dynamic> json) => $ConditionFromJson(json);

	Map<String, dynamic> toJson() => $ConditionToJson(this);

  @JSONField(name:"text")
  String? text;
  @JSONField(name:"icon")
  String? icon;
  @JSONField(name:"code")
  int? code;
}
