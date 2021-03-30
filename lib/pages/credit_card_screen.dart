import 'package:flutter/material.dart';
import 'package:rekur_fluter/globals/colors.dart';
import 'package:rekur_fluter/globals/database_helper.dart';
import 'package:rekur_fluter/globals/global_map.dart';

class CreditCardScreen extends StatefulWidget {
  @override
  _CreditCardScreenState createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  GlobalKey<FormState> _formState = GlobalKey();

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  DatabaseHelper helper;
  var value1, value2, value3, value4, value5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: _getCreditCardContent(),
    );
  }

  _getCreditCardContent() {
    return SingleChildScrollView(
      child: Form(
        key: _formState,
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(
                      "Enter new Rekur",
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
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                margin: EdgeInsets.symmetric(vertical: 30.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/credit_background.jpg')),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Recurring Billing Name",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Recurring Billing Name",
                              border: InputBorder.none,
                            ),
                            controller: textEditingControllers['billingName'],
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _scaffoldState.currentState
                                    .showSnackBar(SnackBar(
                                  content: Text("Billing name is required"),
                                ));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 1, color: Colors.grey),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Payment Method Nickname",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Payment Method Nickname",
                              border: InputBorder.none,
                            ),
                            controller:
                                textEditingControllers['methodNickName'],
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _scaffoldState.currentState
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Payment Method Nickname is required"),
                                ));
                              } else {
                                for (String s in mapPayment.keys) {
                                  if (textEditingControllers['methodNickName']
                                          .text
                                          .toLowerCase() ==
                                      s.toLowerCase()) {
                                    setState(() {
                                      textEditingControllers['methodNickName']
                                          .text = 'images / Payment / $s.png';
                                    });
                                  } else {
                                    _scaffoldState.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Please enter valid Payment method nickname value"),
                                    ));
                                  }
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 1, color: Colors.grey),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Billing Date",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Billing Date",
                              border: InputBorder.none,
                            ),
                            controller: textEditingControllers['billingDate'],
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _scaffoldState.currentState
                                    .showSnackBar(SnackBar(
                                  content: Text("Billing date is required"),
                                ));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 1, color: Colors.grey),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Payment Expense Value",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Payment Expense Value",
                              border: InputBorder.none,
                            ),
                            controller: textEditingControllers['expenseValue'],
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _scaffoldState.currentState
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text("Payment Expense Value is required"),
                                ));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 1, color: Colors.grey),
                    getDropdown("BillingCycle", value1, billingCycle,3,1),
                    Divider(thickness: 1, color: Colors.grey),
                    getDropdown("Payment Method Expiration", value2, expirationPayment, 4, 2),
                    getDropdown("Payment Method Alert",value3,methodAlert,4,2),
                    getDropdown("Payment Due Date Alert",value4,dueAlert,8,8),
                    getDropdown("Currency",value5,currency,5,1),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text("Note",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Note",
                              border: InputBorder.none,
                            ),
                            controller: textEditingControllers['note'],
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.pinkButtonColor),
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: MaterialButton(
                      onPressed: () {},
                      child: new Text(
                        "Save and create new with same payment method",
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .button
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.greenAccentColor),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formState.currentState.validate()) {
                          helper.insert({
                            'billingName':
                                textEditingControllers['billingName'].text,
                            'visaImage':
                                textEditingControllers['methodNickName'].text,
                            'billingDate':
                                textEditingControllers['billingDate'].text,
                            'billingExpense':
                                textEditingControllers['expenseValue'].text,
                            'billingCycle': value1,
                            'expirationValue': value2,
                            'methodAlert': value3,
                            'dueDateAlert': value4,
                            'currency': value5,
                          });
                        }
                      },
                      child: new Text(
                        "Save",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .button
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  getDropdown(String s, value1, List<String> billingCycle,int myValue,int myValue1) {
    return Row(
      children: [
        Expanded(
          flex: myValue,
          child: Text(s,
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyText1
                  .copyWith(color: Colors.white)),
        ),
        Expanded(
          flex: myValue1,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: value1,
                dropdownColor: Colors.white,
                items: billingCycle.map((e) {
                  return DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    value1 = value;
                  });
                }),
          ),
        ),
      ],
    );
  }
}
