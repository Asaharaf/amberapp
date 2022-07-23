import 'package:amber_erp/models/authentication.dart';

class report {
  final String clientName;
  final double salesAmount;
  final String paymentMode;

  const report({
    required this.clientName,
    required this.salesAmount,
    required this.paymentMode,
  });
}

Future<List> getSalesReport(DateTime today) async {
  List<dynamic> list =
      (await SalesReportMaster().salesreportdetail(today) as List)
          .reversed
          .toList();
  //print(list);
  return list;
}
