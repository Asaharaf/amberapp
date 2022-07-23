import 'package:amber_erp/components/report_dropdown.dart';
import 'package:flutter/material.dart';
class CommonReports extends StatelessWidget {
  const CommonReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: Padding(
       padding: EdgeInsets.only(top: 48.0,left: 32.0,right: 32.0),
       child: ReportDropdown(text: 'Report',),
     ),

    );
  }
}
