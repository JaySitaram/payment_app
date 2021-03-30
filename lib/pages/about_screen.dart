import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getAboutScreen(),
    );
  }

  _getAboutScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                flex: 7,
                child: Text(
                  "SETTINGS",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline5
                      .copyWith(color: Colors.white),
                )),
            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context);
                  },
                  icon: Icon(
                    Icons.highlight_remove_sharp,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/background_image.jpg'))),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                    Text("About",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline6
                            .copyWith(color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 80.0,
                ),
                Center(
                  child: Image.asset(
                    "images/Rekur-App-Launch-Logo.png",
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    "v1.0.0",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    "www.rekurapp.com",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ))
      ],
    );
  }
}
