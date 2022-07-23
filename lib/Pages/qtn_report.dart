import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuotationReport extends StatefulWidget {
  const QuotationReport({Key? key}) : super(key: key);

  @override
  _QuotationReportState createState() => _QuotationReportState();
}

class _QuotationReportState extends State<QuotationReport> {

  List<dynamic> Report =  [];
  Future<List> getQuotation() async{
    DateTime today = DateTime.now();
    QuotationMaster().qtnreport(today).then((value){
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

      appBar: AppBar(title: Text("Quotation Report"),),
      body: FutureBuilder(
          future: getQuotation(),
          builder: (BuildContext context,
              AsyncSnapshot<List>snapshot){
            if(snapshot.hasData)
            {
              return ListView.builder(itemBuilder: (BuildContext,index){
                var element = Report.elementAt(index);
                //print(element['salesdate']);
                return Card(color: Colors.blueGrey[100],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: ClipRRect(borderRadius:BorderRadius.circular(30),child: const Image(image: AssetImage("assets/quotationIcon.png"),)),
                    title: Text(element['clientName'],style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
                    subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('QR:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),),
                            Text(element['qtnAmount'],style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Text('QTN no: ${element['qtnNo']}',style: const TextStyle(color: Colors.black),),
                      ],
                    ),
                    trailing: Column(
                      children:<Widget>[
                    Chip(label: Text(element['qtnDate'],style: const TextStyle(color: Colors.blue),)),
                        // Text(element['qtnNo'],style: const TextStyle(color: Colors.black),),
                    ],),
                  ),
                  elevation: 5,
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
