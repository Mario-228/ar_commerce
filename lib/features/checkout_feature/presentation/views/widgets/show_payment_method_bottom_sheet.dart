import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/payment_method_list_tile_item.dart';

Future<void> showPaymentMethodBottomSheet({
  required BuildContext context,
}) async {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            PaymentMethodListTileItem(onTap: () {}, title: "paypal"),
            PaymentMethodListTileItem(onTap: () {}, title: "stripe"),
            PaymentMethodListTileItem(onTap: () {}, title: "paymob"),
          ],
        ),
      );
    },
  );
}
