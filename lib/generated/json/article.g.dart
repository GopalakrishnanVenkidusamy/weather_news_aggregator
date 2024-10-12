import 'package:weather_news_aggregator/generated/json/base/json_convert_content.dart';
import 'package:weather_news_aggregator/model/article.dart';
import 'package:weather_news_aggregator/model/source.dart';


Article $ArticleFromJson(Map<String, dynamic> json) {
	final Article article = Article();
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		article.author = author;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		article.title = title;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		article.description = description;
	}
	final String? urlToImage = jsonConvert.convert<String>(json['urlToImage']);
	if (urlToImage != null) {
		article.urlToImage = urlToImage;
	}
	final String? publishedAt = jsonConvert.convert<String>(json['publishedAt']);
	if (publishedAt != null) {
		article.publishedAt = publishedAt;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		article.content = content;
	}
	final Source? source = jsonConvert.convert<Source>(json['source']);
	if (source != null) {
		article.source = source;
	}
	return article;
}

Map<String, dynamic> $ArticleToJson(Article entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['author'] = entity.author;
	data['title'] = entity.title;
	data['description'] = entity.description;
	data['urlToImage'] = entity.urlToImage;
	data['publishedAt'] = entity.publishedAt;
	data['content'] = entity.content;
	data['source'] = entity.source?.toJson();
	return data;
}