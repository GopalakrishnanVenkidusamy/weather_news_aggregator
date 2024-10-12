import 'package:weather_news_aggregator/generated/json/base/json_convert_content.dart';
import 'package:weather_news_aggregator/model/day.dart';
import 'package:weather_news_aggregator/model/condition.dart';


Day $DayFromJson(Map<String, dynamic> json) {
	final Day day = Day();
	final double? maxTempC = jsonConvert.convert<double>(json['maxtemp_c']);
	if (maxTempC != null) {
		day.maxTempC = maxTempC;
	}
	final double? minTempC = jsonConvert.convert<double>(json['mintemp_c']);
	if (minTempC != null) {
		day.minTempC = minTempC;
	}
	final double? minTempF = jsonConvert.convert<double>(json['mintemp_f']);
	if (minTempF != null) {
		day.minTempF = minTempF;
	}
	final double? maxTempF = jsonConvert.convert<double>(json['maxtemp_f']);
	if (maxTempF != null) {
		day.maxTempF = maxTempF;
	}
	final Condition? condition = jsonConvert.convert<Condition>(json['condition']);
	if (condition != null) {
		day.condition = condition;
	}
	return day;
}

Map<String, dynamic> $DayToJson(Day entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['maxtemp_c'] = entity.maxTempC;
	data['mintemp_c'] = entity.minTempC;
	data['mintemp_f'] = entity.minTempF;
	data['maxtemp_f'] = entity.maxTempF;
	data['condition'] = entity.condition?.toJson();
	return data;
}