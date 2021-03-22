import 'package:flutter/material.dart';

class CreditCardScreen extends StatefulWidget {
  @override
  _CreditCardScreenState createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  TextEditingController _text1Cntroller = TextEditingController();

  TextEditingController _text2Cntroller = TextEditingController();

  TextEditingController _text3Cntroller = TextEditingController();

  TextEditingController _text4Cntroller = TextEditingController();

  TextEditingController _text5Cntroller = TextEditingController();

  TextEditingController _text6Cntroller = TextEditingController();

  TextEditingController _text7Cntroller = TextEditingController();

  TextEditingController _text8Cntroller = TextEditingController();

  TextEditingController _text9Cntroller = TextEditingController();

  var values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: _getCreditCardContent(),
    );
  }

  _getCreditCardContent() {
    return SingleChildScrollView(
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
                          controller: _text1Cntroller,
                          onChanged: (value) {},
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
                          controller: _text2Cntroller,
                          onChanged: (value) {},
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
                          controller: _text3Cntroller,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1, color: Colors.grey),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text("Billing Cycle",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                .copyWith(color: Colors.white)),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Billing Cycle",
                            border: InputBorder.none,
                          ),
                          controller: _text4Cntroller,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1, color: Colors.grey),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text("Payment Method Expiration",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                .copyWith(color: Colors.white)),
                      ),
                      Expanded(
                        flex: 1,
                        child: DropdownButton(
                            value: values,
                            items: [
                              DropdownMenuItem(
                                child: Text("First Item"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Second Item"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("Third Item"), value: 3),
                              DropdownMenuItem(
                                  child: Text("Fourth Item"), value: 4)
                            ],
                            onChanged: (value) {
                              setState(() {
                                values = value;
                              });
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text("Payment Method Alert",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                .copyWith(color: Colors.white)),
                      ),
                      Expanded(
                        flex: 1,
                        child: DropdownButton(
                            value: values,
                            items: [
                              DropdownMenuItem(
                                child: Text("First Item"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Second Item"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("Third Item"), value: 3),
                              DropdownMenuItem(
                                  child: Text("Fourth Item"), value: 4)
                            ],
                            onChanged: (value) {
                              setState(() {
                                values = value;
                              });
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text("Payment Due Date Alert",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                .copyWith(color: Colors.white)),
                      ),
                      Expanded(
                        flex: 1,
                        child: DropdownButton(
                            value: values,
                            items: [
                              DropdownMenuItem(
                                child: Text("First Item"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Second Item"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("Third Item"), value: 3),
                              DropdownMenuItem(
                                  child: Text("Fourth Item"), value: 4)
                            ],
                            onChanged: (value) {
                              setState(() {
                                values = value;
                              });
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text("Currency",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                .copyWith(color: Colors.white)),
                      ),
                      Expanded(
                        flex: 1,
                        child: DropdownButton(
                            value: values,
                            items: [
                              DropdownMenuItem(
                                child: Text("First Item"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Second Item"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                  child: Text("Third Item"), value: 3),
                              DropdownMenuItem(
                                  child: Text("Fourth Item"), value: 4)
                            ],
                            onChanged: (value) {
                              setState(() {
                                values = value;
                              });
                            }),
                      ),
                    ],
                  ),
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
                          controller: _text9Cntroller,
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
                      color: Colors.pink),
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: MaterialButton(
                    onPressed: () {},
                    child: new Text(
                      "Save and create new with same payment method",
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
                      color: Colors.lightGreen),
                  child: MaterialButton(
                    onPressed: () {},
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
    );
  }
}
