import 'package:weather_news_aggregator/generated/json/news.g.dart';

import 'package:weather_news_aggregator/generated/json/base/json_field.dart';
import 'package:weather_news_aggregator/model/article.dart';

@JsonSerializable()
class News {

	News();

	factory News.fromJson(Map<String, dynamic> json) => $NewsFromJson(json);

	Map<String, dynamic> toJson() => $NewsToJson(this);

  @JSONField(name:"status")
  String? status;
  @JSONField(name:"articles")
  List<Article>? articles;
}
