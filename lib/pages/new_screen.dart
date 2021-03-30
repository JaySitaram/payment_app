import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rekur_fluter/globals/app_themes.dart';
import 'package:rekur_fluter/pages/upgrade_screen.dart';

class NewScreen extends StatefulWidget {
  Function onPressed;

  NewScreen({this.onPressed});
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  TextEditingController _text1Cntroller = TextEditingController();

  TextEditingController _text2Cntroller = TextEditingController();

  TextEditingController _text3Cntroller = TextEditingController();

  TextEditingController _text4Cntroller = TextEditingController();

  TextEditingController _text5Cntroller = TextEditingController();

  TextEditingController _text6Cntroller = TextEditingController();

  TextEditingController _text7Cntroller = TextEditingController();

  TextEditingController _text8Cntroller = TextEditingController();

  TextEditingController _text9Cntroller = TextEditingController();

  var isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _getCreditCardContent(),
    );
  }

  _getCreditCardContent() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Text(
                  "SETTINGS",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline5
                      .copyWith(color: Colors.grey),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.highlight_remove_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            margin: EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/credit_background.jpg')),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                  child: Text("GENERAL",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(color: Colors.white)),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                Container(
                    height: 30.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text("SORT BY",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "SORT BY",
                              border: InputBorder.none,
                            ),
                            controller: _text1Cntroller,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    )),
                Divider(thickness: 1, color: Colors.grey),
                Container(
                    height: 30.0,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("DEFAULT CURRENCY",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: "DEFAULT CURRENCY",
                              border: InputBorder.none,
                            ),
                            controller: _text2Cntroller,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    )),
                Divider(thickness: 1, color: Colors.grey),
                Container(
                    height: 30.0,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text("BADGE NOTIFICATION",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 120.0,
                            child: CupertinoSwitch(
                              onChanged: toggleSwitch,
                              value: isSwitched,
                              activeColor: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    )),
                Divider(thickness: 1, color: Colors.grey),
                Container(
                    height: 40.0,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text("ALERT SOUND",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "ALERT SOUND",
                              border: InputBorder.none,
                            ),
                            controller: _text4Cntroller,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    )),
                Divider(thickness: 1, color: Colors.grey),
                Container(
                    height: 40.0,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text("LIGHT THEME",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 120.0,
                            child:CupertinoSwitch(
    value: Provider.of<AppStateNotifier>(context,listen: false).isDarkMode,
    onChanged: (boolVal) {
        Provider.of<AppStateNotifier>(context,listen: false).updateTheme(boolVal);
    },
),
                          ),
                        ),
                      ],
                    )),
                Divider(thickness: 1, color: Colors.grey),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("EXPORT MY DATA",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          .copyWith(color: Colors.white)),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Text("INFO",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(color: Colors.white)),
                ),
                Divider(thickness: 1, color: Colors.grey),
                Container(
                    height: 30.0,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text("FEEDBACK",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "FEEDBACK",
                              border: InputBorder.none,
                            ),
                            controller: _text7Cntroller,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    )),
                Divider(thickness: 1, color: Colors.grey),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      widget.onPressed(false);
                    },
                    child: Text("ABOUT",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1
                            .copyWith(color: Colors.white)),
                  ),
                ),
                Divider(thickness: 1, color: Colors.grey),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("RATE REKUR",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          .copyWith(color: Colors.white)),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.width / 7,
                    width: MediaQuery.of(context).size.width / 2,
                    child: MaterialButton(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        widget.onPressed(true);
                      },
                      child: new Text(
                        "UPGRADE",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .button
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }
}
