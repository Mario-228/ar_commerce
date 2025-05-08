import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/get_orders_profile_cubit/get_order_profile_cubit.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/get_orders_profile_cubit/get_order_profile_states.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../../../data/models/get_orders_model.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderProfileCubit, GetOrderProfileStates>(
      builder: (context, state) {
        if (state is GetOrderProfileSuccessState) {
          return PdfPreview(
            canDebug: false,
            allowSharing: true,
            allowPrinting: true,
            useActions: true,
            scrollViewDecoration: BoxDecoration(color: Colors.grey[100]),
            build: (format) => _generatePdf(format, state.order),
          );
        } else if (state is GetOrderProfileErrorState) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, GetOrderModel order) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(24),
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Text("Order Invoice",
                style:
                    pw.TextStyle(fontSize: 26, fontWeight: pw.FontWeight.bold)),
          ),
          pw.SizedBox(height: 10),
          pw.Text("Customer Name: ${order.name}"),
          pw.Text("Email: ${order.email}"),
          pw.Text("Phone: ${order.phone}"),
          pw.Text("Address: ${order.address}"),
          pw.SizedBox(height: 12),
          pw.Text("Payment Method: ${order.paymentMethod}"),
          pw.Text("Transaction ID: ${order.transactionId}"),
          pw.Text("Order Status: ${order.status}"),
          pw.Text("Total Amount: ${order.total.toStringAsFixed(2)} EGP"),
          pw.SizedBox(height: 20),
          pw.Text("Order Details",
              style:
                  pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.TableHelper.fromTextArray(
            border: null,
            cellAlignment: pw.Alignment.centerLeft,
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            headers: ['Product ID', 'Quantity', 'Price (EGP)'],
            data: order.orderDetail
                .map((item) => [
                      item.productId.toString(),
                      item.quantity.toString(),
                      item.price.toStringAsFixed(2),
                    ])
                .toList(),
          ),
          pw.SizedBox(height: 30),
          pw.Text("Thank you for your order!",
              style: pw.TextStyle(fontStyle: pw.FontStyle.italic)),
        ],
      ),
    );

    return pdf.save();
  }
}
