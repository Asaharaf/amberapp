import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';

class SalesorderReport extends StatefulWidget {
  const SalesorderReport({Key? key}) : super(key: key);

  @override
  _SalesorderReportState createState() => _SalesorderReportState();
}

class _SalesorderReportState extends State<SalesorderReport> {

  List<dynamic> Report =  [];
  Future<List> getSalesOrder() async{
    DateTime today = DateTime.now();
    SalesorderMaster().salesorderreport(today).then((value){
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

      appBar: AppBar(title: Text("Sales Order")),
      body: FutureBuilder(
          future: getSalesOrder(),
          builder: (BuildContext context,
              AsyncSnapshot<List>snapshot){
            if(snapshot.hasData)
            {
              return ListView.builder(itemBuilder: (BuildContext,index){
                var element = Report.elementAt(index);
                //print(element['salesdate']);
                return Card(color: Colors.blueGrey[100],shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: ClipRRect(borderRadius:BorderRadius.circular(30),child: const Image(image: AssetImage("assets/salesorderIcon.png"),)),
                    title: Text(element['clientName'],style: const TextStyle(fontWeight: FontWeight.w600,),),
                    subtitle: Wrap(children: <Widget>[
                      const Text("Orderno:",style: TextStyle(color: Colors.white60),),
                      Text(element['orderNo'],style: const TextStyle(color: Colors.white60),)
                    ],
                        ),
                    trailing: Wrap(spacing:12,
                        children:<Widget> [
                          const Text('QR:',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w300),),
                      Text(element['orderAmount'],style: const TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                ),

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
