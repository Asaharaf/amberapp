import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/stockreport_model.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockReport extends StatefulWidget {
  const StockReport({Key? key}) : super(key: key);

  @override
  _StockReportState createState() => _StockReportState();
}

class _StockReportState extends State<StockReport> {
  Future<List<stockreport>> getStockData() async {
    DateTime today = DateTime.now();
    List value = await getStockReport(today);
    List<stockreport> widList = value
        .map((element) => stockreport(
              ItemsName: element['itemsName'],
              qty: int.parse(element['Qty']),
            ))
        .toList();
    return widList;
  }

  // List<DataGridRow> get rows => dataGridRow;
  //
  //
  // DataGridRowAdapter buildRow(DataGridRow row) {
  //   Color getBackgroundColor() {
  //     int index = dataGridRow.indexOf(row) + 1;
  //     if (index % 2 == 0) {
  //       return Colors.amber[100]!;
  //     } else {
  //       return Colors.red[100]!;
  //     }
  //   }
  //
  //   return DataGridRowAdapter(
  //       color: getBackgroundColor(),
  //       cells: row.getCells().map<Widget>((e) {
  //         return Container(
  //           alignment: Alignment.center,
  //           padding: EdgeInsets.all(8.0),
  //           child: Text(e.value.toString()),
  //         );
  //       }).toList());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Stock Report')),
      body: FutureBuilder(
          future: getStockData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<stockreport>> snapshot) {
            if (snapshot.hasData) {
              final reportList = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DataTable(
                          // dividerThickness: 5,
                          // dataRowHeight: 50,
                          // columnSpacing: 170,
                          // showBottomBorder: true,
                          // headingTextStyle: const TextStyle(
                          //     fontWeight: FontWeight.bold, color: Colors.blue),
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text("Description"),
                            ),
                            DataColumn(label: Text("Qty")),
                          ],
                          rows: reportList!
                              .map(
                                (element) => DataRow(
                                  color:
                                      MaterialStateColor.resolveWith((states) {
                                    return reportList.indexOf(element) % 2 != 0
                                        ? Colors.white
                                        : Colors
                                            .blueGrey[50]!; //make tha magic!
                                  }),
                                  cells: [
                                    DataCell(Text(
                                      element.ItemsName.length > 20
                                          ? element.ItemsName.substring(0, 20) +
                                              '..'
                                          : element.ItemsName,
                                    )),
                                    DataCell(Text(element.qty.toString())),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("You don't have permission to access"),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
