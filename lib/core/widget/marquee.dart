import 'package:weather_news_aggregator/path_export.dart';

class Marquee extends StatefulWidget {
  final Widget child;

  const Marquee({super.key, required this.child});

  @override
  _MarqueeState createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> {
  late ScrollController scrollController;

  var animationDuration = const Duration(milliseconds: 6000);
  var backDuration = const Duration(milliseconds: 800);
  var pauseDuration = const Duration(milliseconds: 800);

  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: 50.0);
    WidgetsBinding.instance.addPostFrameCallback(scroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      child: widget.child,
    );
  }

  void scroll(_) async {
    while (scrollController.hasClients) {
      await Future.delayed(pauseDuration);
      if (scrollController.hasClients) {
        await scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: animationDuration,
          curve: Curves.ease,
        );
      }
      await Future.delayed(pauseDuration);
      if (scrollController.hasClients) {
        await scrollController.animateTo(
          0.0,
          duration: backDuration,
          curve: Curves.easeOut,
        );
      }
    }
  }
}
