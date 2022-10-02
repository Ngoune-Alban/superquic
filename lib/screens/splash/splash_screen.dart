import 'dart:async';

import 'package:flutter/material.dart';
import 'package:superking/constants.dart';
import 'package:superking/screens/splash/components/body.dart';
import 'package:superking/size_config.dart';

import 'components/splash_content.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



_timer() async {
   Timer(
    Duration(seconds: 3),
    () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Body()));
    },
  );
}

@override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              height: 120,
              width: size.width * 0.9,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
