import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfitReport extends StatefulWidget {

  const ProfitReport({Key? key}) : super(key: key);

  @override
  _ProfitReportState createState() => _ProfitReportState();
}

class _ProfitReportState extends State<ProfitReport> {
  List<dynamic> Report =  [];
  Future<List> getProfit() async{
    DateTime today = DateTime.now();
    ProfitMaster().profitreport(today).then((value){
      List<dynamic>list = (value as List).reversed.toList();

      setState(() {
        Report = list;
      });

    });
return Report;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profit Report"),),
      body: FutureBuilder(
        future: getProfit(),
        builder: (BuildContext context,
            AsyncSnapshot<List>snapshot){
          if(snapshot.hasData)
            {
               return ListView.builder(itemBuilder: (BuildContext,index){
                 var element = Report.elementAt(index);
                 //print(element['salesdate']);
                 return Card(color: Colors.blueGrey[100],shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             Icon(Icons.bar_chart,size: 75),
                     Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                             Padding(
                               padding: const EdgeInsets.symmetric(vertical: 8.0),
                               child: Text('Sales : ${element['salesamount']}',style: const TextStyle(fontWeight: FontWeight.w600,),),
                             ),

                             Padding(
                               padding: const EdgeInsets.symmetric(vertical: 8.0),
                               child: Text('Cost : ${element['costamount']}',),
                             ),
                       ],
                     ),
                           ],
                         ),
                     Container(margin: EdgeInsets.only(bottom: 8),
                       padding: const EdgeInsets.all(8.0),

                       child: Column(mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Chip(
                             label: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text('${element['salesdate']}'),
                             ),
                           ),Text('Profit : ${element['profitamount']}',style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,),),
                         ],
                       ),
                     )
                   ]),
                   elevation: 3,
                 );
               },
                 itemCount: Report.length,
                 shrinkWrap: true,
                 padding: const EdgeInsets.all(5),
                 scrollDirection: Axis.vertical,
               );
            }
          else if (snapshot.hasError) {
            return const Center(
              child: Text("no data found"),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
}
