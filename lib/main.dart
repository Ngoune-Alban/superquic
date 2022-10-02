import 'package:flutter/material.dart';
import 'package:superking/routes.dart';
import 'package:superking/screens/profile/profile_screen.dart';
import 'package:superking/screens/splash/splash_screen.dart';
import 'package:superking/theme.dart';

import 'screens/splash/components/body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Body(),
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
