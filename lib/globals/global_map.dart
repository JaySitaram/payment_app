import 'package:flutter/cupertino.dart';

Map<String, TextEditingController> textEditingControllers = {
  "billingName": TextEditingController(),
  "methodNickName": TextEditingController(),
  "billingDate": TextEditingController(),
  "expenseValue": TextEditingController(),
  "note": TextEditingController(),
};

Map<String, dynamic> mapPayment = {
  "Check": "images/Payment/Check.png",
  "Bank Transfer": "images/Payment/Bank Transfer.png",
  "Cash": "images/Payment/Cash.png",
  "Discover": "images/Payment/Discover.png",
  "PayPal": "images/Payment/PayPal.png",
  "Visa": "images/Payment/Visa.png",
  "Zelle": "images/Payment/Zelle.png",
  "Mastercard": "images/Payment/Mastercard.png",
  "Other": "images/Payment/Other.png",
  "Amex": "images/Payment/Amex.png"
};

List<String> billingCycle = [
    'Monthly',
    'Weekly',
    'Yearly',
    'Quarterly',
    'Daily'
  ];

  List<String> expirationPayment = ['Never Expires', 'Expires'];

  List<String> currency = ['USD', 'INR', 'YEN', 'EUR'];

  List<String> methodAlert = [
    '1 Month Prior to Expiration',
    '1 Week Prior to Expiration',
    '1 Day Prior to Expiration',
    '1 hour Prior to Expiration'
  ];

  List<String> dueAlert = [
    '1 Week Prior to Billing',
    '1 Month Prior to Billing',
    '1 hour Prior to Billing',
    '1 Day Prior to Billing'
  ];
