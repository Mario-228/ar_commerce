import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/orders_profile_view/my_orders_view/widgets/order_detail_pdf.dart';

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem({
    super.key,
    required this.order,
  });
  final GetOrderModel order;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.pink.shade50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.info, color: Colors.brown),
              title: Text("Order#${order.id}"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => navigateTo(context, OrderDetailPdf(order: order)),
            ),
            if (order.status == "pending") ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      // handlePayment(order);
                    },
                    icon: const Icon(Icons.payment),
                    label: const Text("Pay Now"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      // Show confirmation dialog
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Delete Order"),
                          content: const Text(
                              "Are you sure you want to delete this order?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // deleteOrder(order.id);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              child: const Text("Delete"),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text("Delete"),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void navigateTo(BuildContext context, Widget widget) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
