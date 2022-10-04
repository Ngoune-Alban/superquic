import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:superking/routes.dart';
import 'package:superking/screens/profile/profile_screen.dart';
import 'package:superking/screens/splash/splash_screen.dart';
import 'package:superking/theme.dart';

import 'screens/splash/components/body.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
