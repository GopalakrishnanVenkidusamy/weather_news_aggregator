import 'package:weather_news_aggregator/generated/json/base/json_convert_content.dart';
import 'package:weather_news_aggregator/model/source.dart';

Source $SourceFromJson(Map<String, dynamic> json) {
	final Source source = Source();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		source.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		source.name = name;
	}
	return source;
}

Map<String, dynamic> $SourceToJson(Source entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}