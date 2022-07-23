import 'package:amber_erp/Pages/category_profit.dart';
import 'package:amber_erp/Pages/chequenotificationreceived.dart';
import 'package:amber_erp/Pages/login_page.dart';
import 'package:amber_erp/Pages/purchase_report.dart';
import 'package:amber_erp/Pages/purchasecomparison_report.dart';
import 'package:amber_erp/Pages/qtn_report.dart';
import 'package:amber_erp/Pages/salescomparison_report.dart';
import 'package:amber_erp/Pages/salesorder_report.dart';
import 'package:amber_erp/Pages/stock_report.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../utils/constant.dart';
import 'notification.dart';

class MyAppbar extends StatefulWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  _MyAppbarState createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: .05, top: 10),
        child: Row(
          children: [
            Image.asset(
              "assets/AmberIcon.ico",
              height: 50,
              width: 50,
            ),
            const Text(
              "AMBER",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
            )
          ],
        ),
      ),
      // leading: GestureDetector(child: MyNotification(),),
      //flexibleSpace: ClipRRect(borderRadius: BorderRadius.circular(80), child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/amber logo final-01.jpg"),fit: BoxFit.cover)),height: 50,width: 50,)),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: PopupMenuButton<int>(
            color: Colors.white,
            itemBuilder: (context) => [
              // const PopupMenuItem<int>(
              //     value: 0, child: Text("Purchase Report")),
              // const PopupMenuItem<int>(
              //     value: 1, child: Text("Quotation Report")),
              const PopupMenuItem<int>(
                  value: 2, child: Text("Categorywise Profit")),
              const PopupMenuItem<int>(value: 3, child: Text("Stock Report")),
              const PopupMenuItem<int>(
                  value: 4, child: Text("Sales Comparison")),
              const PopupMenuItem<int>(
                  value: 5, child: Text("Purchase Comparison")),
              const PopupMenuItem<int>(
                  value: 6, child: Text("Salesorder Report")),
              const PopupMenuItem<int>(value: 7, child: Text("Cheque Report")),
              const PopupMenuDivider(),
              PopupMenuItem<int>(
                  value: 8,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Logout"),
                    ],
                  )),
            ],
            onSelected: (int menu) {
              if (menu == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PurchaseReport()));
              }

              if (menu == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuotationReport()));
              }

              if (menu == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryProfit()));
              }

              if (menu == 3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StockReport()));
              }

              if (menu == 4) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SalesComparison()));
              }

              if (menu == 5) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PurchaseComparison()));
              }

              if (menu == 6) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SalesorderReport()));
              }

              if (menu == 7) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ChequeNotificationReceived()));
              }

              if (menu == 8) {
                _showMyDialog();
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: GestureDetector(child: const MyNotification(),),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: GestureDetector(
            onTap: () => _showMyDialog(),
            child: const Icon(Icons.logout),
          ),
        )
      ],
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are You Sure You Want to Logout?'),
          content: const SingleChildScrollView(),
          actions: <Widget>[
            TextButton(
              child: const Text('Confirm'),
              onPressed: () async {
                final _sharedPrefs = await SharedPreferences.getInstance();
                _sharedPrefs.remove(SAVE_KEY_NAME);
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login_page()));
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx) => const Login_page()),
                    (route) => false);
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
