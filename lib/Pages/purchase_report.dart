import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/purchasereport_model.dart';
import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PurchaseReport extends StatefulWidget {
  const PurchaseReport({Key? key}) : super(key: key);

  @override
  _PurchaseReportState createState() => _PurchaseReportState();
}

class _PurchaseReportState extends State<PurchaseReport> {
  Future<List<purchasereport>> getData() async {
    DateTime today = DateTime.now();
    List value = await getPurchasereport(today);

    List<purchasereport> widList = value
        .map((element) => purchasereport(
            supplierName: element['SupplierName'],
            purchaseAmount: double.parse(element['PurchaseAmount']),
            paymentMode: element['PaymentMode'],
            invoiceNo: element['InvoiceNo']))
        .toList();

    return widList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Purchase Report')),
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<purchasereport>> snapshot) {
            if (snapshot.hasData) {
              final reportList = snapshot.data;
              double total = 0;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          // dividerThickness: 5,
                          // dataRowHeight: 50,
                          // columnSpacing: 10,
                          // showBottomBorder: true,
                          // headingTextStyle: const TextStyle(
                          //     fontWeight: FontWeight.bold, color: Colors.black),
                          columns: const <DataColumn>[
                            DataColumn(label: Text("supplier")),
                            DataColumn(label: Text("Amount")),
                            DataColumn(label: Text("Mode")),
                            DataColumn(label: Text("In. No")),
                          ],
                          rows: reportList!.map((element) {
                            total += element.purchaseAmount;
                            return DataRow(
                              color: MaterialStateColor.resolveWith((states) {
                                return reportList.indexOf(element) % 2 != 0
                                    ? Colors.white
                                    : Colors.blueGrey[50]!; //make tha magic!
                              }),
                              cells: [
                                DataCell(
                                  Text(
                                    element.supplierName.length > 12
                                        ? element.supplierName
                                                .substring(0, 12) +
                                            '..'
                                        : element.supplierName,
                                  ),
                                ),
                                DataCell(
                                    Text(element.purchaseAmount.toString())),
                                DataCell(Text(element.paymentMode)),
                                DataCell(Text(element.invoiceNo)),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      child: Card(
                        child: ListTile(
                            title: const Text("Total amount :"),
                            trailing: Text(
                              "$total",
                              style: Theme.of(context).textTheme.headline6,
                            )),
                      ),
                    )
                  ]),
                ],
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("no data found"),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
