import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rekur_fluter/globals/colors.dart';
import 'package:rekur_fluter/globals/database_helper.dart';
import 'package:rekur_fluter/models/transaction.dart';
import 'package:rekur_fluter/pages/home_page.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TextEditingController _searchController = TextEditingController();

  DatabaseHelper helper;
  BannerAd myBanner;
  List<TransactionModel> transactionList = [];
  List<Color> _colors = [AppColors.card1Color, AppColors.card2Color];
  List<double> _stops = [0.0, 0.7];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper = DatabaseHelper.instance;
    getValues();
    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544~3347511713',
      size: AdSize.banner,
      request: AdRequest(),
      listener: AdListener(),
    );

    final AdListener listener = AdListener(
      onAdLoaded: (Ad ad) => print('Ad loaded.'),
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print('Ad failed to load: $error');
      },
      onAdOpened: (Ad ad) => print('Ad opened.'),
      onAdClosed: (Ad ad) => print('Ad closed.'),
      onApplicationExit: (Ad ad) => print('Left application.'),
    );
    myBanner.load();
  }

  void getValues() async {
    var result = await helper.queryAllRows();
    print(result);
    setState(() {
      transactionList =
          result.map((e) => TransactionModel.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // getValues();
    return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 7.0),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: _colors,
                          stops: _stops,
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "24",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline2
                                  .copyWith(color: Colors.white),
                            ),
                            Text("Rekurs",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline5
                                    .copyWith(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 7.0),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: _colors,
                          stops: _stops,
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("\$${365.84}",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline5
                                    .copyWith(color: Colors.white)),
                            Text("Average Spend/Months",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline5
                                    .copyWith(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Text("Upcoming Expirations & Renewals",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                .copyWith(color: Colors.white))),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.calendar_today, color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text("Search",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                .copyWith(color: Colors.white))),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.searchTextColor,
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                            border: InputBorder.none,
                          ),
                          controller: _searchController,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            return getSearchQuery(_searchController.text);
                          },
                          icon: Icon(Icons.search, color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(children: [
                  Expanded(
                      flex: 4,
                      child: Text("Rekur",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
                              .copyWith(color: Colors.purple))),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Expense",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          .copyWith(color: Colors.purple),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Expiration",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          .copyWith(color: Colors.purple),
                    ),
                  ),
                ]),
                Expanded(
                  flex: 1,
                  child: AdWidget(ad: myBanner),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              transactionList[index].imageName,
                              width: 40.0,
                              height: 40.0,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                transactionList[index].cardNumber.toString(),
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              transactionList[index].cardName,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              transactionList[index].cardPrice,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              transactionList[index].cardExpiry,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ]));
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void getSearchQuery(String value) async {
    print(value);
    var values = await helper.searchQuery(value);
    if (values.length > 0) {
      transactionList.clear();
      setState(() {
        transactionList =
            values.map((e) => TransactionModel.fromJson(e)).toList();
      });
    }
  }
}
