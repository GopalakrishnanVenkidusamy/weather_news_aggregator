import 'package:weather_news_aggregator/path_export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cityNameController = TextEditingController();
  NewsAPICategory selectedNewsAPICategory = NewsAPICategory.none;
  List<bool> selectedTemperatureUnits = [true, false];

  @override
  void initState() {

    context.read<WeatherAndNewsProvider>().fetchWeather("tiruppur");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherAndNewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today News"),
        titleTextStyle: TextStyles.textStyleFontSize20
            .copyWith(fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: ConstWidget.paddingAll20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: 340,
                  child: weatherInfo(provider)), // Displays current weather
              SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: newsList(provider)), // Displays filtered news headlines
            ],
          ),
        ),
      ),
    );
  }

  /// WeatherInfo
  Widget weatherInfo(WeatherAndNewsProvider provider) {
    if (provider.isFetchingWeather) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Card(
              elevation: 2,
              child: Stack(
                children: [
                  /// Background Weather Images
                  backgroundWeatherImage(),

                  /// Weather Forecast
                  Padding(
                    padding: ConstWidget.paddingAll10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Weather Forecast Title
                                SizedBox(
                                  width: 250,
                                  child: Text("Today's Weather Forecast",
                                      style: TextStyles.textStyleFontSize20
                                          .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25),
                                      maxLines: 1),
                                ),
                                ConstWidget.kSizeBoxHeight5,

                                /// Weather Forecast City Name
                                locationSelector(),
                                ConstWidget.kSizeBoxHeight5,

                                /// Weather Last Updated Time
                                Text(
                                    HelperClass().formatDateTimeWithTime(context
                                            .read<WeatherAndNewsProvider>()
                                            .weather
                                            ?.currentWeather
                                            ?.lastUpdated ??
                                        ""),
                                    style: TextStyles.textStyleFontSize14),
                                ConstWidget.kSizeBoxHeight10,

                                /// Temperature View
                                if (selectedTemperatureUnits.first == true) ...[
                                  Text(
                                    "${context.read<WeatherAndNewsProvider>().weather?.currentWeather?.temp_c ?? ""}\u00B0C",
                                    style: TextStyles.textStyleFontSize20
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                  ),
                                ] else ...[
                                  Text(
                                    "${context.read<WeatherAndNewsProvider>().weather?.currentWeather?.temp_f ?? ""}\u00B0F",
                                    style: TextStyles.textStyleFontSize20
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                  ),
                                ],

                                /// Temperature condition text
                                Text(
                                  context
                                          .read<WeatherAndNewsProvider>()
                                          .weather
                                          ?.currentWeather
                                          ?.condition
                                          ?.text ??
                                      "",
                                  style: TextStyles.textStyleFontSize16
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),

                            /// Weather Image and select TemperatureUnit ToggleButtons
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /// select TemperatureUnit ToggleButtons
                                temperatureToggle(),
                                /// Weather Image
                                SizedBox(
                                  height: 120,
                                  width: 150,
                                  child: Image.network(
                                    context
                                            .read<WeatherAndNewsProvider>()
                                            .weather
                                            ?.currentWeather
                                            ?.condition
                                            ?.icon ??
                                        "",
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ConstWidget.kSizeBoxHeight20,

          /// Weather Forecast View 5 Days
          forecastGrid(provider),
          //
        ],
      );
    }
  }

  /// News List
  Widget newsList(WeatherAndNewsProvider provider) {
    return Column(
        children: [
      Row(
        children: [
          /// News Filter
          PopupMenuButton<NewsAPICategory>(
            icon: const Icon(Icons.filter_list),
            initialValue: selectedNewsAPICategory,
            onSelected: (NewsAPICategory item) {
              selectedNewsAPICategory = item;
              context.read<WeatherAndNewsProvider>().fetchNews(item);
              setState(() {});
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<NewsAPICategory>>[
              const PopupMenuItem<NewsAPICategory>(
                value: NewsAPICategory.general,
                child: ListTile(
                    leading: Icon(Icons.public_outlined),
                    title: Text("General")),
              ),
              const PopupMenuItem<NewsAPICategory>(
                value: NewsAPICategory.business,
                child: ListTile(
                    leading: Icon(Icons.business), title: Text("Business")),
              ),
              const PopupMenuItem<NewsAPICategory>(
                value: NewsAPICategory.health,
                child: ListTile(
                    leading: Icon(Icons.medical_services_outlined),
                    title: Text("Health")),
              ),
              const PopupMenuItem<NewsAPICategory>(
                value: NewsAPICategory.technology,
                child: ListTile(
                    leading: Icon(Icons.precision_manufacturing_outlined),
                    title: Text("Technology")),
              ),
              const PopupMenuItem<NewsAPICategory>(
                value: NewsAPICategory.science,
                child: ListTile(
                    leading: Icon(Icons.science_outlined),
                    title: Text("Science")),
              ),
              const PopupMenuItem<NewsAPICategory>(
                value: NewsAPICategory.sports,
                child: ListTile(
                    leading: Icon(Icons.sports), title: Text("Sports")),
              ),
              const PopupMenuItem<NewsAPICategory>(
                value: NewsAPICategory.entertainment,
                child: ListTile(
                    leading: Icon(Icons.movie_creation_outlined),
                    title: Text("Entertainment")),
              ),
            ],
          ),
          ConstWidget.kSizeBoxWidth20,
          Text(
            "Latest News",
            style: TextStyles.textStyleFontSize18
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),

      /// News GridView
      newsGridView(provider)
    ]);
  }

  /// Widget to display a grid view of news articles
  Widget newsGridView(WeatherAndNewsProvider provider){
    return  Expanded(
      child: provider.isFetchingNews
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        shrinkWrap: true,
        itemCount:
        context.read<WeatherAndNewsProvider>().newsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 280,
          crossAxisCount: HelperClass.getCurrentPlatform(context) !=
              CurrentPlatform.mobile
              ? 3
              : 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          /// News View
          return Container(
            color: Colors.grey.shade400,
            child: Column(
              children: [
                /// News Image
                Image.network(
                    context.read<WeatherAndNewsProvider>()
                        .newsList[index]
                        .urlToImage ??
                        "",
                    height: 180,
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                    errorBuilder: (context, error, stackTrace) {
                      /// Error News Image
                      return const SizedBox(
                          height: 180,
                          width: 180,
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 100,
                          )); // Provide a local placeholder image
                    }),

                /// News source and Title
                Container(
                  alignment: Alignment.topLeft,
                  padding: ConstWidget.paddingAll10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// News Source
                      Text(
                          context
                              .read<WeatherAndNewsProvider>()
                              .newsList[index]
                              .source
                              ?.name ??
                              "",
                          style: TextStyles.textStyleFontSize12),
                      ConstWidget.kSizeBoxHeight10,

                      /// News Title
                      Text(
                          context
                              .read<WeatherAndNewsProvider>()
                              .newsList[index]
                              .title ??
                              "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.textStyleFontSize16
                              .copyWith(fontWeight: FontWeight.w600))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget backgroundWeatherImage(){
    return SvgPicture.asset(
        'assets/images/background_weather_images/sunny.svg',
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width);
  }

  /// Allows user to select a city for weather info
  Widget locationSelector() {
    return  InkWell(
        onTap: () {
          CustomAlertDialog.showAlertDialog(
            context,
            Text("Enter a city name",
                style: TextStyles
                    .textStyleFontSize18
                    .copyWith(
                    fontWeight:
                    FontWeight.bold)),
            TextField(
              controller: cityNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a city name',
              ),
            ),
            [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text("CANCEL",
                    style: TextStyles
                        .textStyleFontSize14
                        .copyWith(
                        fontWeight:
                        FontWeight.bold,
                        color: Colors.red)),
              ),
              ConstWidget.kSizeBoxWidth10,
              InkWell(
                onTap: () {
                  if (cityNameController
                      .text.isNotEmpty) {
                    context
                        .read<
                        WeatherAndNewsProvider>()
                        .fetchWeather(
                        cityNameController
                            .text);
                    Navigator.pop(context);
                  } else {
                    CustomSnackBar.showSnackBar(
                        context,
                        "Enter Valid City");
                  }
                },
                child: Text(
                  "OK",
                  style: TextStyles
                      .textStyleFontSize14
                      .copyWith(
                      fontWeight:
                      FontWeight.bold,
                      color: Colors
                          .green.shade800),
                ),
              )
            ],
          );
        },
        child: Row(
          children: [
            const Icon(Icons.edit_location_outlined,
                color: Colors.blue),
            ConstWidget.kSizeBoxWidth5,
            SizedBox(
              width: HelperClass.getCurrentPlatform(context) !=
                  CurrentPlatform.mobile
                  ?MediaQuery.sizeOf(context).width/1.5:220,
              child: Marquee(
                child: Text(
                    "${context.read<WeatherAndNewsProvider>().weather?.location?.name ?? ""}, ${context.read<WeatherAndNewsProvider>().weather?.location?.region ?? ""}, ${context.read<WeatherAndNewsProvider>().weather?.location?.country ?? ""}",
                    style: TextStyles
                        .textStyleFontSize18
                        .copyWith(
                        fontWeight:
                        FontWeight.w600)),
              ),
            ),
          ],
        ));
  }

  /// Toggle buttons for switching temperature units
  Widget temperatureToggle() {
    return SizedBox(
      height: 30,
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(16),
        selectedColor: Colors.green.shade800,
        isSelected: selectedTemperatureUnits,
        onPressed: (index) {
          /// Toggle chart or table visibility and trigger a log data request
          int i = selectedTemperatureUnits
              .indexOf(true);
          selectedTemperatureUnits[i] = false;
          setState(() {
            selectedTemperatureUnits[index] =
            !selectedTemperatureUnits[index];
          });
        },
        children: [
          Text("\u00B0C",
              style: TextStyles.textStyleFontSize18
                  .copyWith(
                  fontWeight: FontWeight.bold)),
          Text("\u00B0F",
              style: TextStyles.textStyleFontSize18
                  .copyWith(
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  /// Displays weather forecast in a grid view
  Widget forecastGrid(WeatherAndNewsProvider provider) {
    return SizedBox(
      height: 120,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: context
            .read<WeatherAndNewsProvider>()
            .weather
            ?.forecast
            ?.forecastday
            ?.length ??
            0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 100,
          crossAxisCount: HelperClass.getCurrentPlatform(context) ==
              CurrentPlatform.web
              ? 5
              : HelperClass.getCurrentPlatform(context) !=
              CurrentPlatform.mobile
              ? 3
              : 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          /// Weather Forecast View 5 Days
          return weatherMinMaxTemp(
            context
                .read<WeatherAndNewsProvider>()
                .weather
                ?.forecast
                ?.forecastday?[index]
                .day
                ?.condition
                ?.icon ??
                "",
            context
                .read<WeatherAndNewsProvider>()
                .weather
                ?.forecast
                ?.forecastday?[index]
                .date ??
                "",
            selectedTemperatureUnits.first == true
                ? "${context.read<WeatherAndNewsProvider>().weather?.forecast?.forecastday?[index].day?.minTempC?.toString() ?? ""}\u00B0C"
                : "${context.read<WeatherAndNewsProvider>().weather?.forecast?.forecastday?[index].day?.minTempC?.toString() ?? ""}\u00B0F",
            selectedTemperatureUnits.first == true
                ? "${context.read<WeatherAndNewsProvider>().weather?.forecast?.forecastday?[index].day?.maxTempC?.toString() ?? ""}\u00B0C"
                : "${context.read<WeatherAndNewsProvider>().weather?.forecast?.forecastday?[index].day?.minTempC?.toString() ?? ""}\u00B0F",
          );
        },
      ),
    );
  }

  /// Displays min/max temperatures for a given day and Displays daily weather details
  Widget weatherMinMaxTemp(
      String imageUrl, String date, String tempMin, String tempMax) {
    return Stack(
      children: [
        backgroundWeatherImage(),
        Padding(
          padding: ConstWidget.paddingAll8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  HelperClass().formatDateWithoutTime(date),
                  style: TextStyles.textStyleFontSize14.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Image.network(imageUrl),
                  ConstWidget.kSizeBoxWidth10,
                  Column(
                    children: [
                      Text("Temp.Min  : $tempMin",
                          style: TextStyles.textStyleFontSize12.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      ConstWidget.kSizeBoxHeight5,
                      Text("Temp.Max : $tempMax",
                          style: TextStyles.textStyleFontSize12.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );}


}
