import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:rekur_fluter/globals/colors.dart';
import 'package:rekur_fluter/globals/database_helper.dart';
import 'package:rekur_fluter/models/transaction.dart';
import 'package:rekur_fluter/pages/home_page.dart';

const String testDevice = 'YOUR_DEVICE_ID';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TextEditingController _searchController = TextEditingController();

  DatabaseHelper helper;
  List<TransactionModel> transactionList = [];
  List<Color> _colors1 = [Color(0xFF2EC0B4), Color(0xFF3257A7)];
  List<Color> _colors2 = [Color(0xFF5F0BF7), Colors.purple];
  List<double> _stops2 = [0.0,0.7];
  List<double> _stops1=[0.0,0.7];
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  BannerAd _bannerAd;
  NativeAd _nativeAd;
  InterstitialAd _interstitialAd;
  int _coins = 0;

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  NativeAd createNativeAd() {
    return NativeAd(
      adUnitId: NativeAd.testAdUnitId,
      factoryId: 'adFactoryExample',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("$NativeAd event $event");
      },
    );
  }

  @override
  void initState() {
    super.initState();
    helper = DatabaseHelper.instance;
    getValues();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _bannerAd = createBannerAd()..load();
    _bannerAd.show();
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print("RewardedVideoAd event $event");
      if (event == RewardedVideoAdEvent.rewarded) {
        setState(() {
          _coins += rewardAmount;
        });
      }
    };
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
                            horizontal: 10.0, vertical: 7.0),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: _colors2,
                              stops: _stops2,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
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
                            horizontal: 10.0, vertical: 7.0),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: _colors1,
                              stops: _stops1,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("\$${365.84}",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline4
                                    .copyWith(color: Colors.white)),
                            SizedBox(height: 10.0,),        
                            Text("Average Spend/Months",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6
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
                      flex: 3,
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
                // Expanded(
                //   flex: 1,
                //   child: AdWidget(ad: myBanner),
                // ),
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
