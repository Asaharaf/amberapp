import 'package:amber_erp/Pages/customer_summary.dart';
import 'package:amber_erp/Pages/supplier_summary.dart';
import 'package:flutter/material.dart';

class SummaryReport extends StatefulWidget {
  const SummaryReport({Key? key}) : super(key: key);

  @override
  _SummaryReportState createState() => _SummaryReportState();
}

class _SummaryReportState extends State<SummaryReport> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Summary Report'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Customer',icon: Icon(Icons.home)),
              Tab(text: 'Supplier',icon: Icon(Icons.star)),

            ],
          )
        ),
        body: const TabBarView(
          children: [
            CustomerSummary(),
            SupplierSummary(),

          ],
        ),
      ),
    );
  }
}
