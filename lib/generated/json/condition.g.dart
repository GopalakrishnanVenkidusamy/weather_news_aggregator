import 'package:weather_news_aggregator/generated/json/base/json_convert_content.dart';
import 'package:weather_news_aggregator/model/condition.dart';

Condition $ConditionFromJson(Map<String, dynamic> json) {
	final Condition condition = Condition();
	final String? text = jsonConvert.convert<String>(json['text']);
	if (text != null) {
		condition.text = text;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		condition.icon = icon;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		condition.code = code;
	}
	return condition;
}

Map<String, dynamic> $ConditionToJson(Condition entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['text'] = entity.text;
	data['icon'] = entity.icon;
	data['code'] = entity.code;
	return data;
}