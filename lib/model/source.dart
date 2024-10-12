import 'package:weather_news_aggregator/generated/json/base/json_field.dart';
import 'package:weather_news_aggregator/generated/json/source.g.dart';



@JsonSerializable()
class Source {

	Source();

	factory Source.fromJson(Map<String, dynamic> json) => $SourceFromJson(json);

	Map<String, dynamic> toJson() => $SourceToJson(this);

@JSONField(name:"id")
String? id;
@JSONField(name:"name")
String? name;
}