import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:superking/constants.dart';
import 'package:superking/screens/sign_in/sign_in_screen.dart';
//import 'package:superking/screens/town/town.dart';
import 'package:superking/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //Initialize Firebase App
  // this is something I need to change later
  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();
  //   return firebaseApp;
  // }

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Bienvenue dans votre application \nSuperQuinc!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "Faites vos courses dans les quincailleries \ndu Cameroun",
      "image": "assets/images/splash_2.png"
    },
    {"text": "Livrez-vous à  domicile", "image": "assets/images/splash_3.png"},
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                image: splashData[index]["image"],
                text: splashData[index]['text'],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    DefaultButton(
                      text: "Continuer",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    // Spacer(),
                    // DefaultButton(
                    //   text: "Continue",
                    //   press: () {
                    //     Navigator.pushNamed(context, SignInScreen.routeName);
                    //   },
                    // ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
