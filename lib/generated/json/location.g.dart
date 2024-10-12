import 'package:weather_news_aggregator/generated/json/base/json_convert_content.dart';
import 'package:weather_news_aggregator/model/location.dart';

Location $LocationFromJson(Map<String, dynamic> json) {
	final Location location = Location();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		location.name = name;
	}
	final String? region = jsonConvert.convert<String>(json['region']);
	if (region != null) {
		location.region = region;
	}
	final String? country = jsonConvert.convert<String>(json['country']);
	if (country != null) {
		location.country = country;
	}
	final double? lat = jsonConvert.convert<double>(json['lat']);
	if (lat != null) {
		location.lat = lat;
	}
	final double? lon = jsonConvert.convert<double>(json['lon']);
	if (lon != null) {
		location.lon = lon;
	}
	final String? tzId = jsonConvert.convert<String>(json['tz_id']);
	if (tzId != null) {
		location.tzId = tzId;
	}
	final String? localtime = jsonConvert.convert<String>(json['localtime']);
	if (localtime != null) {
		location.localtime = localtime;
	}
	return location;
}

Map<String, dynamic> $LocationToJson(Location entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['region'] = entity.region;
	data['country'] = entity.country;
	data['lat'] = entity.lat;
	data['lon'] = entity.lon;
	data['tz_id'] = entity.tzId;
	data['localtime'] = entity.localtime;
	return data;
}