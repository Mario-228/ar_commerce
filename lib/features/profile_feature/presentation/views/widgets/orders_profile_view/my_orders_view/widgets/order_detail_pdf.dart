import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class OrderDetailPdf extends StatelessWidget {
  final GetOrderModel order;

  const OrderDetailPdf({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Invoice")),
      body: PdfPreview(
        canDebug: false,
        allowSharing: true,
        allowPrinting: true,
        useActions: true,
        scrollViewDecoration: BoxDecoration(color: Colors.grey[100]),
        build: (format) => _generatePdf(format, order),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, GetOrderModel order) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        margin: const pw.EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Text(
              "Order Invoice",
              style: pw.TextStyle(fontSize: 26, fontWeight: pw.FontWeight.bold),
            ),
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
          pw.Table.fromTextArray(
            border: pw.TableBorder.all(width: 0.5, color: PdfColors.grey),
            headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
            cellAlignment: pw.Alignment.center,
            columnWidths: {
              0: const pw.FlexColumnWidth(2), // Product ID
              1: const pw.FlexColumnWidth(2), // Quantity
              2: const pw.FlexColumnWidth(3), // Price
            },
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
