import 'package:flutter/material.dart';
import 'package:rekur_fluter/globals/colors.dart';
import 'package:rekur_fluter/pages/home_page.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                            horizontal: 15.0, vertical: 10.0),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 3,
                        color: AppColors.card2Color,
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
                            horizontal: 15.0, vertical: 10.0),
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 3,
                        color: AppColors.card1Color,
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
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                            border: InputBorder.none,
                          ),
                          controller: _searchController,
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.search, color: Colors.white),
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listTransaction.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              listTransaction[index].imageName,
                              height: 20.0,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              listTransaction[index].cardNumber,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              listTransaction[index].cardName,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              listTransaction[index].cardPrice,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              listTransaction[index].cardExpiry,
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
}
