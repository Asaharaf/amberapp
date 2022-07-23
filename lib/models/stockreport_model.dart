import 'package:amber_erp/models/authentication.dart';

class stockreport{
  final String ItemsName;
  final int qty;

  const stockreport({

    required this.ItemsName,
    required this.qty
});
}

Future<List> getStockReport(DateTime today) async{
  List<dynamic> list =( await StockReportMaster().stockreportdetails(today) as List).reversed.toList();

  return list;
}