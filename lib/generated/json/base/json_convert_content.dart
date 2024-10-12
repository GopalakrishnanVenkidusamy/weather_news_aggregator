// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:weather_news_aggregator/model/article.dart';
import 'package:weather_news_aggregator/model/condition.dart';
import 'package:weather_news_aggregator/model/current_weather.dart';
import 'package:weather_news_aggregator/model/day.dart';
import 'package:weather_news_aggregator/model/forecast.dart';
import 'package:weather_news_aggregator/model/forecastday.dart';
import 'package:weather_news_aggregator/model/location.dart';
import 'package:weather_news_aggregator/model/news.dart';
import 'package:weather_news_aggregator/model/source.dart';
import 'package:weather_news_aggregator/model/weather.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(Article).toString(): Article.fromJson,
		(Condition).toString(): Condition.fromJson,
		(CurrentWeather).toString(): CurrentWeather.fromJson,
		(Day).toString(): Day.fromJson,
		(Forecast).toString(): Forecast.fromJson,
		(ForecastDay).toString(): ForecastDay.fromJson,
		(Location).toString(): Location.fromJson,
		(News).toString(): News.fromJson,
		(Source).toString(): Source.fromJson,
		(Weather).toString(): Weather.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if(value == null){
      return null;
    }
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<Article>[] is M){
			return data.map<Article>((Map<String, dynamic> e) => Article.fromJson(e)).toList() as M;
		}
		if(<Condition>[] is M){
			return data.map<Condition>((Map<String, dynamic> e) => Condition.fromJson(e)).toList() as M;
		}
		if(<CurrentWeather>[] is M){
			return data.map<CurrentWeather>((Map<String, dynamic> e) => CurrentWeather.fromJson(e)).toList() as M;
		}
		if(<Day>[] is M){
			return data.map<Day>((Map<String, dynamic> e) => Day.fromJson(e)).toList() as M;
		}
		if(<Forecast>[] is M){
			return data.map<Forecast>((Map<String, dynamic> e) => Forecast.fromJson(e)).toList() as M;
		}
		if(<ForecastDay>[] is M){
			return data.map<ForecastDay>((Map<String, dynamic> e) => ForecastDay.fromJson(e)).toList() as M;
		}
		if(<Location>[] is M){
			return data.map<Location>((Map<String, dynamic> e) => Location.fromJson(e)).toList() as M;
		}
		if(<News>[] is M){
			return data.map<News>((Map<String, dynamic> e) => News.fromJson(e)).toList() as M;
		}
		if(<Source>[] is M){
			return data.map<Source>((Map<String, dynamic> e) => Source.fromJson(e)).toList() as M;
		}
		if(<Weather>[] is M){
			return data.map<Weather>((Map<String, dynamic> e) => Weather.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}