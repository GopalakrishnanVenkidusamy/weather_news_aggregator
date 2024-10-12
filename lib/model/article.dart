import 'package:weather_news_aggregator/generated/json/base/json_field.dart';
import 'package:weather_news_aggregator/generated/json/article.g.dart';
import 'package:weather_news_aggregator/model/source.dart';




@JsonSerializable()
class Article {

	Article();

	factory Article.fromJson(Map<String, dynamic> json) => $ArticleFromJson(json);

	Map<String, dynamic> toJson() => $ArticleToJson(this);


  @JSONField(name:"author")
  String? author;
  @JSONField(name:"title")
  String? title;
  @JSONField(name:"description")
  String? description;
  @JSONField(name:"urlToImage")
  String? urlToImage;
  @JSONField(name:"publishedAt")
  String? publishedAt;
  @JSONField(name:"content")
  String? content;
  @JSONField(name:"source")
  Source? source;
}