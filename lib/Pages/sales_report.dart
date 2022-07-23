import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/salesreport_model.dart';
import 'package:flutter/material.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({Key? key}) : super(key: key);

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  Future<List<report>> getData() async {
    DateTime today = DateTime.now();
    List value = await getSalesReport(today);
   // print("ffffff$value");
    List<report> widList = value
        .map((element) => report(
            clientName: element['CustomerName'],
            salesAmount: double.parse(element['SaleAmount']),
            paymentMode: element['PaymentMode']))
        .toList();

    return widList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0, title: const Text('Sales Report')),
        body: FutureBuilder(
            future: getData(),
            builder:
                (BuildContext context, AsyncSnapshot<List<report>> snapshot) {
              if (snapshot.hasData) {
                double total = 0;
                final reportList = snapshot.data;
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: DataTable(
                          // headingRowColor: MaterialStateColor.resolveWith(
                          //     (states) => Colors.blueGrey),
                          // headingTextStyle: TextStyle(color: Colors.white),
                          // dataRowColor:
                          //     MaterialStateColor.resolveWith((states) => Colors.grey),
                          columns: const <DataColumn>[
                            DataColumn(label: Text("ClientName")),
                            DataColumn(label: Text("SaleAmount")),
                            DataColumn(label: Text("Mode")),
                          ],
                          rows: reportList!.map(
                            (element) {
                              total += element.salesAmount;
                              print(total);
                              return DataRow(
                                color: MaterialStateColor.resolveWith((states) {
                                  return reportList.indexOf(element) % 2 != 0
                                      ? Colors.white
                                      : Colors.blueGrey[50]!; //make tha magic!
                                }),
                                cells: [
                                  DataCell(Text(element.clientName)),
                                  DataCell(Center(
                                      child: Text(
                                          element.salesAmount.toString()))),
                                  DataCell(
                                      Center(child: Text(element.paymentMode))),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        child: Card(
                          child: ListTile(
                              title: const Text("Total amount :"),
                              trailing: Text(
                                total.toStringAsFixed(2),
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
      ),
    );
  }
}
