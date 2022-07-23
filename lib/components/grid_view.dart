import 'package:amber_erp/Pages/HomeScreen.dart';
import 'package:amber_erp/Pages/cash_summary.dart';
import 'package:amber_erp/Pages/profit_report.dart';
import 'package:amber_erp/Pages/purchase_report.dart';
import 'package:amber_erp/Pages/qtn_report.dart';
import 'package:amber_erp/Pages/sales_report.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyGridview extends StatefulWidget {
  List<GridData> listData;
  MyGridview({Key? key, this.listData = const []}) : super(key: key);

  @override
  _MyGridviewState createState() => _MyGridviewState();
}

class _MyGridviewState extends State<MyGridview> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: (1 / .6)),
      itemCount: widget.listData.length,
      itemBuilder: (BuildContext context, int index) {
        GridData data = widget.listData.elementAt(index);
        return GestureDetector(
          onTap: () {
            if (data.title == 'Dashbord') {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home_Screen()));
            }

            if (data.title == 'SalesReport') {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SalesReport()));
            }
            if (data.title == 'PurchaseReport') {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PurchaseReport()));
            }
            if (data.title == 'QuotationReport') {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const QuotationReport()));
            }

            if (data.title == 'CashSummary') {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CashSummary()));
            }

            if (data.title == 'ProfitReport') {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfitReport()));
            }
          },
          child: SizedBox(
            height: 100,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.only(top: 30, right: 10, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(
                  //   data.icon,color: Colors.blue,
                  //   size: 50,
                  // ),
                  Lottie.network(data.icon, height: 50),
                  Text(
                    data.title,
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class GridData {
  String icon;
  String title;

  GridData(this.icon, this.title);
}
