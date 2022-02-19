import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      navigatorKey: navigatorKeyMain,
    );
  }
}

final navigatorKeyMain = GlobalKey<NavigatorState>();
final navigatorKeyMovie = GlobalKey<NavigatorState>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MovieNestedScreen()));
            },
            child: Text('이동')),
      ),
    );
  }
}

class MovieNestedScreen extends StatelessWidget {
  const MovieNestedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKeyMovie,
      onGenerateRoute: (routeSettings) {
        return generateRoute(routeSettings, context);
      },
    );
  }

  Route generateRoute(RouteSettings settings, BuildContext context) {
    print(settings.name);
    switch (settings.name) {
      case '/review':
        return MaterialPageRoute(builder: (context) => ReviewScreen());
      case '/movie':
      default:
        return MaterialPageRoute(builder: (context) => MovieScreen());
    }
  }
}

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(navigatorKeyMain.currentContext!).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('무비 스크린'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(navigatorKeyMovie.currentContext!)
                  .push(MaterialPageRoute(
                builder: (context) => ReviewScreen(),
              ));
            },
            child: Text('리뷰')),
      ),
    );
  }
}

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('리뷰 스크린'),
      ),
      body: Container(),
    );
  }
}
