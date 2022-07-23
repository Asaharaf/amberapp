import 'package:amber_erp/components/category_Row.dart';
import 'package:amber_erp/components/pie_chart_view.dart';
import 'package:flutter/material.dart';

class CategoryViewChart extends StatelessWidget {
  const CategoryViewChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return
      // Scaffold(
      //  body:SafeArea(
        Column(children: <Widget>[
          //Spacer(),
          SizedBox(
            height:height*0.43,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: height * 0.070),
                  const Text('Top sales category',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 18),),


                  Expanded(child: Row(children: const <Widget>[
                    MyCategoryRow(),
                    MyPieChartView(),
                  ],)),
                ],
              ),
            ),

          )
        ],);
    // ),
    // );
  }
}
