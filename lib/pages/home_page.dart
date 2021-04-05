import 'package:flutter/material.dart';
import 'package:rekur_fluter/globals/colors.dart';
import 'package:rekur_fluter/pages/about_screen.dart';
import 'package:rekur_fluter/pages/credit_card_screen.dart';
import 'package:rekur_fluter/pages/transaction_screen.dart';
import 'package:rekur_fluter/pages/upgrade_screen.dart';

import 'new_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  void _onItemTapped(int index) {
    _selectedIndex = index;
    if (_selectedIndex == 1) {
      return showAlertDialog();
    } else if (_selectedIndex == 2) {
      return showSettingsDialog();
    }
  }

  showAlertDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              insetPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: Colors.grey, width: 1, style: BorderStyle.solid)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: CreditCardScreen(),
            ));
  }

  showMyAboutDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              insetPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: Colors.grey, width: 1, style: BorderStyle.solid)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: AboutScreen(),
            ));
  }

  showSettingsDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              insetPadding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                      color: Colors.grey, width: 1, style: BorderStyle.solid)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: NewScreen(
                onPressed: (value) async {
                  print(value);
                  Navigator.pop(context);
                  if (value) {
                    return await showUpgradeDialog();
                  } else {
                    return await showMyAboutDialog();
                  }
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.width / 6,
          child: BottomAppBar(
            color: AppColors.bottomAppBarColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_none_outlined,
                        size: 40.0, color: Colors.white),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.width / 5,
                    width: MediaQuery.of(context).size.width / 5,
                    color: AppColors.pinkAccentColor,
                    child: IconButton(
                      onPressed: () {
                        return showAlertDialog();
                      },
                      icon: Icon(Icons.add_box_outlined,
                          size: 40.0, color: Colors.white),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: IconButton(
                        onPressed: () {
                          return showSettingsDialog();
                        },
                        icon: Icon(Icons.settings,
                            size: 40.0, color: Colors.white))),

              ],
            ),
          ),
        ),
        body: TransactionScreen());
  }

  showUpgradeDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
            insetPadding: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: UpgradeScreen()));
  }
}
