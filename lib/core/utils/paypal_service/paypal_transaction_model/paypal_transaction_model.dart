import 'amount.dart';
import 'item_list.dart';

class PaypalTransactionModel {
  Amount? amount;
  ItemList? itemList;

  PaypalTransactionModel({this.amount, this.itemList});

  factory PaypalTransactionModel.fromJson(Map<String, dynamic> json) {
    return PaypalTransactionModel(
      amount: json['amount'] == null
          ? null
          : Amount.fromJson(json['amount'] as Map<String, dynamic>),
      itemList: json['item_list'] == null
          ? null
          : ItemList.fromJson(json['item_list'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'item_list': itemList?.toJson(),
      };
}
