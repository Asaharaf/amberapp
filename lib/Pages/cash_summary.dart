import 'dart:math';

import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/cashsummary_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:intl/intl.dart';

// final List data=[
//   {
//     'color': Colors.red
//   },
//   {
//     'color':Colors.green
//   },
//   {
//     'color':Colors.blue
//   },
//   {
//     'color':Colors.yellow
//   },
//   {
//     'color':Colors.amber
//   },
//   {
//     'color':Colors.orange
//   },
//   {
//     'color':Colors.white70
//   },
// ];

class CashSummary extends StatefulWidget {
  const CashSummary({Key? key}) : super(key: key);

  @override
  _CashSummaryState createState() => _CashSummaryState();
}

class _CashSummaryState extends State<CashSummary> {
  // List<MyCard> cards = [];
  //late List<summaryreport> widList;
  Future<List<summaryreport>> getReport() async {
    DateTime today = DateTime.now();
    List value = await cashSummaryReport(today);
    // print(Value);
    // Value.forEach((element) {
    //   print(element);
    // });
    List<summaryreport> widList = value
        .map((element) {
          // print(DateTime.parse(element['summarydate']));
          return summaryreport(
            date: DateTime.parse(element['summarydate']),
            salesAmount: double.parse(element['salesamount'].toString()),
            salesReturn: double.parse(element['salesreturn']),
            purchaseAmount: double.parse(element['purchaseamount']),
            purchaseReturn: double.parse(element['purchasereturn']),
            receivables: double.parse(element['receivables']),
            payables: double.parse(element['payables']),
            otherIncome: double.parse(element['othericome']),
            otherExpense: double.parse(element['otherexpense']),
          );
        })
        .toList()
        .reversed
        .toList();
    print(widList.first.date);
    // print(widList[0].salesAmount);
    return widList;
  }

  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Day book')),
      body: Center(
        child: FutureBuilder(
            future: getReport(),
            builder: (BuildContext context,
                AsyncSnapshot<List<summaryreport>> snapshot) {
              //print(snapshot);
              if (snapshot.hasData) {
                final reportList = snapshot.data;
                // print(reportList);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: CarouselSlider(
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                          height: double.infinity,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          initialPage: reportList!.length - 1,
                        ),
                        items: reportList
                            .map((summryreportData) => MyCard(
                                  Colors.primaries[5],
                                  date: summryreportData.date,
                                  salesAmount:
                                      summryreportData.salesAmount.toStringAsFixed(2),
                                  // data[Random().nextInt(6)]['color'],salesAmount: summryreportData.salesAmount.toString(),
                                  salesreturn:
                                      summryreportData.salesReturn.toStringAsFixed(2),
                                  purchase: summryreportData.purchaseAmount
                                      .toStringAsFixed(2),
                                  purchasereturn: summryreportData
                                      .purchaseReturn
                                      .toStringAsFixed(2),
                                  receivables:
                                      summryreportData.receivables.toStringAsFixed(2),
                                  payables:
                                      summryreportData.payables.toStringAsFixed(2),
                                  otherincome:
                                      summryreportData.otherIncome.toStringAsFixed(2),
                                  otherexpense:
                                      summryreportData.otherExpense.toStringAsFixed(2),
                                ))
                            .toList(),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () => buttonCarouselController.nextPage(
                    //       duration: Duration(milliseconds: 300),
                    //       curve: Curves.linear),
                    //   child: Text('→'),
                    // )
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

class MyCard extends StatefulWidget {
  final Color color;
  final DateTime date;
  String salesAmount,
      salesreturn,
      purchase,
      purchasereturn,
      receivables,
      payables,
      otherincome,
      otherexpense;
  MyCard(this.color,
      {required this.date,
      required this.salesAmount,
      required this.salesreturn,
      required this.purchase,
      required this.purchasereturn,
      required this.receivables,
      required this.payables,
      required this.otherincome,
      required this.otherexpense});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(widget.date).toString();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: widget.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // const Padding(
          //   padding: EdgeInsets.only(top: 25),
          //   child: Center(
          //     child: Text(
          //       "DayBook",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 22,
          //         // color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.white10, width: 1.0))),
                        child: Text(
                          formatted,
                          style: const TextStyle(
                            // color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "SalesAmount",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.salesAmount,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "SalesReturn",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.salesreturn,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Purchase",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.purchase,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "PurchaseReturn",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.purchasereturn,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Receivables",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.receivables,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Payables",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.payables,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "OtherIncome",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.otherincome,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "OtherExpense",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.otherexpense,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("View More"),
              )
            ],
          )
        ],
      ),
    );
  }
}
