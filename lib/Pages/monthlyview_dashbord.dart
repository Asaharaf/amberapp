import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthlyDashBord extends StatefulWidget {
  const MonthlyDashBord({Key? key}) : super(key: key);

  @override
  _MonthlyDashBordState createState() => _MonthlyDashBordState();
}

class _MonthlyDashBordState extends State<MonthlyDashBord> {
  final List<String> TripList = ["Newyork", "Boston", "Payyoli", "vatakara"];
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  List<dynamic> Report = [];

  @override
  void initState() {
    DateTime thisyear = DateTime(DateTime.now().year);
    DashMonthlyList().monthlyreport(thisyear).then((value) {
      List<dynamic> list = (value as List).reversed.toList();

      setState(() {
        Report = list;
      });
    });
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          itemCount: Report.length,
          itemBuilder: (context, index) {
            var element = Report.elementAt(index);
            return Card(
              elevation: 5,
              color: Colors.blue,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    color: Colors.white,
                    height: 200,
                    width: 150,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                        child: Text(
                      element['YearName'],
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    width: 1,
                    height: 200,
                    color: Colors.orangeAccent,
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.blue,
                      height: 200,
                      width: 250,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          const Text(
                            "Sale Amount",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              double.parse(element['salesTotal'])
                                  .toStringAsFixed(2),
                              style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              "SaleReturn Amount",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              double.parse(element['salesReturn']).toStringAsFixed(2),
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
