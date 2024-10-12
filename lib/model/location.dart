import 'package:weather_news_aggregator/generated/json/location.g.dart';

import 'package:weather_news_aggregator/generated/json/base/json_field.dart';

@JsonSerializable()
class Location {

	Location();

	factory Location.fromJson(Map<String, dynamic> json) => $LocationFromJson(json);

	Map<String, dynamic> toJson() => $LocationToJson(this);

  @JSONField(name:"name")
  String? name;
  @JSONField(name:"region")
  String? region;
  @JSONField(name:"country")
  String? country;
  @JSONField(name:"lat")
  double? lat;
  @JSONField(name:"lon")
  double? lon;
  @JSONField(name:"tz_id")
  String? tzId;
  @JSONField(name:"localtime")
  String? localtime;
}