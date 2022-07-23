import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurchaseComparison extends StatefulWidget {
  const PurchaseComparison({Key? key}) : super(key: key);

  @override
  _PurchaseComparisonState createState() => _PurchaseComparisonState();
}

class _PurchaseComparisonState extends State<PurchaseComparison> {


  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  List<dynamic> Report =  [];


  @override
  void initState() {
    DateTime thisyear = DateTime(DateTime.now().year);
    PurchaseComparisonMaster().comparisonreport(thisyear).then((value){
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
      appBar: AppBar(title: Text("Purchase Comparison"),),
      body: SafeArea(
          child: ListView.builder(
            itemCount: Report.length,
            itemBuilder: (context, index) {
              var element =  Report.elementAt(index);
              return Card(
                elevation: 5,
                color: Colors.blue,
                child: Row(mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(color: Colors.white,

                      height: 200,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10),
                      child: Center(child: Text(element['YearName'],style: const TextStyle(color: Colors.blue,fontSize: 22,fontWeight: FontWeight.bold),)),

                    ),
                    Container(width: 1,
                      height: 200,
                      color: Colors.orangeAccent,),
                    Flexible(
                      child: Container(
                        color: Colors.amber,
                        height: 200,
                        width: 250,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10),
                        child: Column(children: [
                          const Image(image: AssetImage("assets/purchaseIcon.png"),height: 80,width: 80,),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('${(double.parse(element['purchaseTotal'])).toStringAsFixed(2)}',style: const TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),

                          ),

                        ],),

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
