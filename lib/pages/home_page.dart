import 'package:flutter/material.dart';
import 'package:rekur_fluter/globals/colors.dart';
import 'package:rekur_fluter/pages/credit_card_screen.dart';
import 'package:rekur_fluter/pages/transaction_screen.dart';

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
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: CreditCardScreen(),
            ));
  }

  showSettingsDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              insetPadding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: NewScreen(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
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
}

class TransactionModel {
  String cardNumber;
  String cardName;
  String cardPrice;
  String cardExpiry;
  String imageName;

  TransactionModel(
      {this.cardNumber,
      this.imageName,
      this.cardName,
      this.cardPrice,
      this.cardExpiry});
}

List<TransactionModel> listTransaction = [
  TransactionModel(
      cardNumber: "0023",
      cardName: "IPhone Payment",
      cardPrice: "${49.00}",
      imageName: 'images/Payment/Amex.png',
      cardExpiry: "06/02/20"),
  TransactionModel(
      cardNumber: "7322",
      cardName: "Gardener",
      cardPrice: "${80}",
      imageName: 'images/Payment/Bank Transfer.png',
      cardExpiry: "08/08/18"),
  TransactionModel(
      cardNumber: "1212",
      cardName: "Insurance",
      cardPrice: "${1200}",
      imageName: 'images/Payment/Cash.png',
      cardExpiry: "03/03/19"),
  TransactionModel(
      cardNumber: "4433",
      cardName: "Trello",
      imageName: 'images/Payment/Check.png',
      cardPrice: "${19.99}",
      cardExpiry: "11/04/17"),
  TransactionModel(
      cardNumber: "0023",
      imageName: 'images/Payment/Discover.png',
      cardName: "IPhone Payment",
      cardPrice: "${49.00}",
      cardExpiry: "06/02/20"),
  TransactionModel(
      cardNumber: "7322",
      cardName: "Gardener",
      imageName: 'images/Payment/Mastercard.png',
      cardPrice: "${80}",
      cardExpiry: "08/08/18"),
  TransactionModel(
      cardNumber: "1212",
      cardName: "Insurance",
      imageName: 'images/Payment/Other.png',
      cardPrice: "${1200}",
      cardExpiry: "03/03/19"),
  TransactionModel(
      cardNumber: "4433",
      cardName: "Trello",
      imageName: 'images/Payment/PayPal.png',
      cardPrice: "${19.99}",
      cardExpiry: "11/04/17"),
  TransactionModel(
      cardNumber: "0023",
      cardName: "IPhone Payment",
      imageName: 'images/Payment/Visa.png',
      cardPrice: "${49.00}",
      cardExpiry: "06/02/20"),
  TransactionModel(
      cardNumber: "7322",
      cardName: "Gardener",
      imageName: 'images/Payment/Visa.png',
      cardPrice: "${80}",
      cardExpiry: "08/08/18"),
  TransactionModel(
      cardNumber: "1212",
      cardName: "Insurance",
      imageName: 'images/Payment/Zelle.png',
      cardPrice: "${1200}",
      cardExpiry: "03/03/19"),
  TransactionModel(
      cardNumber: "4433",
      cardName: "Trello",
      imageName: 'images/Payment/Amex.png',
      cardPrice: "${19.99}",
      cardExpiry: "11/04/17"),
  TransactionModel(
      cardNumber: "0023",
      cardName: "IPhone Payment",
      imageName: 'images/Payment/Bank Transfer.png',
      cardPrice: "${49.00}",
      cardExpiry: "06/02/20"),
  TransactionModel(
      cardNumber: "7322",
      cardName: "Gardener",
      imageName: 'images/Payment/Cash.png',
      cardPrice: "${80}",
      cardExpiry: "08/08/18"),
  TransactionModel(
      cardNumber: "1212",
      cardName: "Insurance",
      imageName: 'images/Payment/Check.png',
      cardPrice: "${1200}",
      cardExpiry: "03/03/19"),
  TransactionModel(
      cardNumber: "4433",
      cardName: "Trello",
      imageName: 'images/Payment/Discover.png',
      cardPrice: "${19.99}",
      cardExpiry: "11/04/17"),
  TransactionModel(
      cardNumber: "0023",
      cardName: "IPhone Payment",
      imageName: 'images/Payment/Mastercard.png',
      cardPrice: "${49.00}",
      cardExpiry: "06/02/20"),
  TransactionModel(
      cardNumber: "7322",
      cardName: "Gardener",
      imageName: 'images/Payment/Other.png',
      cardPrice: "${80}",
      cardExpiry: "08/08/18"),
  TransactionModel(
      cardNumber: "1212",
      cardName: "Insurance",
      imageName: 'images/Payment/PayPal.png',
      cardPrice: "${1200}",
      cardExpiry: "03/03/19"),
  TransactionModel(
      cardNumber: "4433",
      cardName: "Trello",
      imageName: 'images/Payment/Visa.png',
      cardPrice: "${19.99}",
      cardExpiry: "11/04/17"),
];
