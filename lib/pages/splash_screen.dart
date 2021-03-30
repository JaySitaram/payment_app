import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rekur_fluter/pages/home_page.dart';
import 'package:rekur_fluter/pages/credit_card_screen.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _versionName = 'V1.0';
  final splashDelay = 5;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getsplashcontent());
  }

  getsplashcontent() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/splash_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/splash_icon.png',
              color: Colors.white,
              height: MediaQuery.of(context).size.width / 1.5,
              width: MediaQuery.of(context).size.width / 1.5,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Rekur",
              style: Theme.of(context).primaryTextTheme.headline2.copyWith(
                  color: Colors.white,
                  fontFamily: 'MONTSERRAT',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80.0,
            ),
            Text(
              "The smarter,easier way to \n manage your recurring payments",
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline6.copyWith(
                  color: Colors.white,
                  fontFamily: 'FONTAWESOME',
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
