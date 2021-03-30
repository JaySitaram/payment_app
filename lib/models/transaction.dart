import 'package:hive/hive.dart';

class TransactionModel {
  int cardNumber;
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

  factory TransactionModel.fromJson(Map map) {

    return TransactionModel(
      imageName: map['visaImage'],
      cardName:map['billingName'],
      cardExpiry:map['billingDate'],
      cardPrice:map['billingExpense'],
      cardNumber:map['columnId']
    );
  }
}
