import 'package:weather_news_aggregator/generated/json/base/json_convert_content.dart';
import 'package:weather_news_aggregator/model/forecastday.dart';
import 'package:weather_news_aggregator/model/day.dart';


ForecastDay $ForecastDayFromJson(Map<String, dynamic> json) {
	final ForecastDay forecastDay = ForecastDay();
	final String? date = jsonConvert.convert<String>(json['date']);
	if (date != null) {
		forecastDay.date = date;
	}
	final Day? day = jsonConvert.convert<Day>(json['day']);
	if (day != null) {
		forecastDay.day = day;
	}
	return forecastDay;
}

Map<String, dynamic> $ForecastDayToJson(ForecastDay entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['date'] = entity.date;
	data['day'] = entity.day?.toJson();
	return data;
}