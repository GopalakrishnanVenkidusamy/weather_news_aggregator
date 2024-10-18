import 'package:weather_news_aggregator/path_export.dart';


class WeatherAndNewsProvider with ChangeNotifier {
  bool _isFetchingWeatherData= true;
  bool _isFetchingNews= true;
  Weather? _weather;
  List<Article> _newsList = [];

  Weather? get weather => _weather;
  List<Article> get newsList => _newsList;
  bool get isFetchingWeather => _isFetchingWeatherData;
  bool get isFetchingNews => _isFetchingNews;


  Future<void> fetchWeather(String location) async {
    BaseService baseServices = BaseService();
    String weatherApi="https://api.weatherapi.com/v1/forecast.json?key=91e42bf5821d4c939cf153450241010&q=$location&days=5";
    Response response = await baseServices.httpGet(weatherApi);
    if (response.statusCode == 200) {
      _weather = Weather.fromJson(jsonDecode(response.body));
      weatherBasedNewsFilter(_weather?.currentWeather?.temp_c??0);
    }
    _isFetchingWeatherData= false;
    notifyListeners();
  }

  weatherBasedNewsFilter(double temperature){
    if(temperature <= 20){
      // cold
      fetchNews(NewsAPICategory.health);
    }else if(temperature <= 24){
      // cool
      fetchNews(NewsAPICategory.entertainment);
    }else if(temperature >= 25){
      // hot
      fetchNews(NewsAPICategory.science);
    }else {
      fetchNews(NewsAPICategory.general);
    }
  }


  Future<void> fetchNews(NewsAPICategory newsCategory) async {
      BaseService baseServices = BaseService();
      String newsAPI ="https://newsapi.org/v2/top-headlines?category=${newsCategory.name}&apiKey=2291571ac6074c76b3f5b734d24943b6";
      Response response = await baseServices.httpGet(newsAPI);
      if (response.statusCode == 200) {
        _newsList = News.fromJson(jsonDecode(response.body)).articles ?? [];
      }
     _isFetchingNews= false;
     notifyListeners();
  }
}
