import 'package:weather_news_aggregator/generated/json/base/json_convert_content.dart';
import 'package:weather_news_aggregator/model/weather.dart';
import 'package:weather_news_aggregator/model/current_weather.dart';

import 'package:weather_news_aggregator/model/forecast.dart';

import 'package:weather_news_aggregator/model/forecastday.dart';

import 'package:weather_news_aggregator/model/location.dart';


Weather $WeatherFromJson(Map<String, dynamic> json) {
	final Weather weather = Weather();
	final Location? location = jsonConvert.convert<Location>(json['location']);
	if (location != null) {
		weather.location = location;
	}
	final CurrentWeather? currentWeather = jsonConvert.convert<CurrentWeather>(json['current']);
	if (currentWeather != null) {
		weather.currentWeather = currentWeather;
	}
	final Forecast? forecast = jsonConvert.convert<Forecast>(json['forecast']);
	if (forecast != null) {
		weather.forecast = forecast;
	}
	return weather;
}

Map<String, dynamic> $WeatherToJson(Weather entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['location'] = entity.location?.toJson();
	data['current'] = entity.currentWeather?.toJson();
	data['forecast'] = entity.forecast?.toJson();
	return data;
}