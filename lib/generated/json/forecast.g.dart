import 'package:weather_news_aggregator/generated/json/base/json_convert_content.dart';
import 'package:weather_news_aggregator/model/forecast.dart';
import 'package:weather_news_aggregator/model/forecastday.dart';


Forecast $ForecastFromJson(Map<String, dynamic> json) {
	final Forecast forecast = Forecast();
	final List<ForecastDay>? forecastday = jsonConvert.convertListNotNull<ForecastDay>(json['forecastday']);
	if (forecastday != null) {
		forecast.forecastday = forecastday;
	}
	return forecast;
}

Map<String, dynamic> $ForecastToJson(Forecast entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['forecastday'] =  entity.forecastday?.map((v) => v.toJson()).toList();
	return data;
}