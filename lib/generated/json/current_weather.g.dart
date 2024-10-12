import 'package:weather_news_aggregator/generated/json/base/json_convert_content.dart';
import 'package:weather_news_aggregator/model/current_weather.dart';
import 'package:weather_news_aggregator/model/condition.dart';


CurrentWeather $CurrentWeatherFromJson(Map<String, dynamic> json) {
	final CurrentWeather currentWeather = CurrentWeather();
	final String? lastUpdated = jsonConvert.convert<String>(json['last_updated']);
	if (lastUpdated != null) {
		currentWeather.lastUpdated = lastUpdated;
	}
	final double? temp_c = jsonConvert.convert<double>(json['temp_c']);
	if (temp_c != null) {
		currentWeather.temp_c = temp_c;
	}
	final double? temp_f = jsonConvert.convert<double>(json['temp_f']);
	if (temp_f != null) {
		currentWeather.temp_f = temp_f;
	}
	final double? wind_mph = jsonConvert.convert<double>(json['wind_mph']);
	if (wind_mph != null) {
		currentWeather.wind_mph = wind_mph;
	}
	final double? wind_kph = jsonConvert.convert<double>(json['wind_kph']);
	if (wind_kph != null) {
		currentWeather.wind_kph = wind_kph;
	}
	final double? wind_degree = jsonConvert.convert<double>(json['wind_degree']);
	if (wind_degree != null) {
		currentWeather.wind_degree = wind_degree;
	}
	final String? wind_dir = jsonConvert.convert<String>(json['wind_dir']);
	if (wind_dir != null) {
		currentWeather.wind_dir = wind_dir;
	}
	final double? pressure_mb = jsonConvert.convert<double>(json['pressure_mb']);
	if (pressure_mb != null) {
		currentWeather.pressure_mb = pressure_mb;
	}
	final double? pressure_in = jsonConvert.convert<double>(json['pressure_in']);
	if (pressure_in != null) {
		currentWeather.pressure_in = pressure_in;
	}
	final double? precip_mm = jsonConvert.convert<double>(json['precip_mm']);
	if (precip_mm != null) {
		currentWeather.precip_mm = precip_mm;
	}
	final double? precip_in = jsonConvert.convert<double>(json['precip_in']);
	if (precip_in != null) {
		currentWeather.precip_in = precip_in;
	}
	final double? humidity = jsonConvert.convert<double>(json['humidity']);
	if (humidity != null) {
		currentWeather.humidity = humidity;
	}
	final double? cloud = jsonConvert.convert<double>(json['cloud']);
	if (cloud != null) {
		currentWeather.cloud = cloud;
	}
	final double? uv = jsonConvert.convert<double>(json['uv']);
	if (uv != null) {
		currentWeather.uv = uv;
	}
	final Condition? condition = jsonConvert.convert<Condition>(json['condition']);
	if (condition != null) {
		currentWeather.condition = condition;
	}
	return currentWeather;
}

Map<String, dynamic> $CurrentWeatherToJson(CurrentWeather entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['last_updated'] = entity.lastUpdated;
	data['temp_c'] = entity.temp_c;
	data['temp_f'] = entity.temp_f;
	data['wind_mph'] = entity.wind_mph;
	data['wind_kph'] = entity.wind_kph;
	data['wind_degree'] = entity.wind_degree;
	data['wind_dir'] = entity.wind_dir;
	data['pressure_mb'] = entity.pressure_mb;
	data['pressure_in'] = entity.pressure_in;
	data['precip_mm'] = entity.precip_mm;
	data['precip_in'] = entity.precip_in;
	data['humidity'] = entity.humidity;
	data['cloud'] = entity.cloud;
	data['uv'] = entity.uv;
	data['condition'] = entity.condition?.toJson();
	return data;
}