import 'package:flutter/material.dart';
import 'package:treinos/app/views/Home_view.dart';
import 'package:treinos/app/views/MediaTrimestral_view.dart';
import 'package:treinos/app/views/SplashScreen_view.dart';
import 'app/views/MediaRT_view.dart';

main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      routes: {
        '/splash': (context) => SplashScreen(),
        '/media': (context) => Media(),
        '/mediaRt': (context) => MediaRt(),
        '/home': (context) => HomePage(),
      },
      initialRoute: '/splash',
    );
  }
}
