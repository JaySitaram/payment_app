import 'package:flutter/material.dart';
import 'package:rekur_fluter/globals/colors.dart';

class UpgradeScreen extends StatefulWidget {
  @override
  _UpgradeScreenState createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getUpgradeContent(),
    );
  }

  _getUpgradeContent() {
    return Container(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    "SETTINGS",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline5
                        .copyWith(color: Colors.white),
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
                    ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/background_image.jpg'))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "UPGRADE",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Get unlimited Recurring entries.Dont be limited to just 10 entries.Keep track and manage ALL of you expanses in once convinient location!",
                    style: Theme.of(context).primaryTextTheme.title.copyWith(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontFamily: "MONTSERRAT"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Remove ads!Hate ads?Ya,we do too.Unfortunately,we need them to keep the lights on.Remove the annoying ads for less than 75 dollar per month",
                    style: Theme.of(context).primaryTextTheme.title.copyWith(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontFamily: "MONTSERRAT"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Turn on light-mode option.Prefer the white background?Lets do it",
                    style: Theme.of(context).primaryTextTheme.title.copyWith(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontFamily: "MONTSERRAT"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Export your expense files for future use.Want to move your expanse files to another app or save for future referebce?No problem",
                    style: Theme.of(context).primaryTextTheme.title.copyWith(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontFamily: "MONTSERRAT"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                    child: Text(
                      "A \$${20} PER YEAR VALUE! \n NOW AVAILABLE FOR UNDER \$${10} PER MONTH OR LESS THAN 75 DOLLAR PER MONTH! \n - LIMITED TIME OFFER -",
                      style: Theme.of(context).primaryTextTheme.title.copyWith(
                          color: Colors.white,
                          fontFamily: "MONTSERRAT",
                          fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: AppColors.upgradeButtonColor,
                      onPressed: () {},
                      child: Text(
                        "Unlock for just \$${9.00}/year",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .title
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
