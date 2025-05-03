import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project_new_version/core/utils/paypal_service/paypal_keys.dart';
import 'package:graduation_project_new_version/core/utils/paypal_service/paypal_transaction_model/amount.dart';
import 'package:graduation_project_new_version/core/utils/paypal_service/paypal_transaction_model/details.dart';
import 'package:graduation_project_new_version/core/utils/paypal_service/paypal_transaction_model/item.dart';
import 'package:graduation_project_new_version/core/utils/paypal_service/paypal_transaction_model/item_list.dart';
import 'package:graduation_project_new_version/core/utils/paypal_service/paypal_transaction_model/paypal_transaction_model.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';

abstract class PaypalService {
  static PaypalTransactionModel _getTransactionModels(CartModel cartModel) {
    List<Item> items = [];
    Item item;
    for (var product in cartModel.cart) {
      item = Item(
        name: product.product.name,
        quantity: product.quantity,
        price: product.product.price.toString(),
        currency: 'USD',
      );
      items.add(item);
    }
    PaypalTransactionModel transactionModel = PaypalTransactionModel(
      amount: Amount(
        total: cartModel.totalCart.toString(),
        currency: 'USD',
        details: Details(
          subtotal: cartModel.totalCart.toString(),
          shipping: '0',
          shippingDiscount: 0,
        ),
      ),
      itemList: ItemList(items: items),
    );
    return transactionModel;
  }

  static void createPaypalPayment(BuildContext context, CartModel cartModel) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId: PaypalKeys.clientId,
            secretKey: PaypalKeys.secretKey,
            transactions: [_getTransactionModels(cartModel).toJson()],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              print("onSuccess: $params");
              showSnackBar(context, 'Payment Successfull');
              Navigator.pop(context);
            },
            onError: (error) {
              print("onError: $error");
              showSnackBar(context, 'Payment Failed');
              Navigator.pop(context);
            },
            onCancel: () => showSnackBar(context, 'Payment Cancelled'),
          ),
        ),
      );
}
