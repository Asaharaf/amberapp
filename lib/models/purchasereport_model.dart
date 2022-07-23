import 'package:amber_erp/models/authentication.dart';

class purchasereport {
  final String supplierName;
  final double purchaseAmount;
  final String paymentMode;
  final String invoiceNo;

  const purchasereport({
    required this.supplierName,
    required this.purchaseAmount,
    required this.paymentMode,
    required this.invoiceNo,
  });
}

Future<List> getPurchasereport(DateTime today) async {
  List<dynamic> list =
      (await PurchaseReportMaster().purchasereportdetail(today) as List)
          .reversed
          .toList();
  return list;
}
