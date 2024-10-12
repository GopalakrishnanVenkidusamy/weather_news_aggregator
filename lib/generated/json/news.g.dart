import 'package:weather_news_aggregator/generated/json/base/json_convert_content.dart';
import 'package:weather_news_aggregator/model/news.dart';
import 'package:weather_news_aggregator/model/article.dart';


News $NewsFromJson(Map<String, dynamic> json) {
	final News news = News();
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		news.status = status;
	}
	final List<Article>? articles = jsonConvert.convertListNotNull<Article>(json['articles']);
	if (articles != null) {
		news.articles = articles;
	}
	return news;
}

Map<String, dynamic> $NewsToJson(News entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['articles'] =  entity.articles?.map((v) => v.toJson()).toList();
	return data;
}