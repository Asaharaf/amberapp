
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';

class SupplierSummary extends StatefulWidget {
  const SupplierSummary({Key? key}) : super(key: key);

  @override
  _SupplierSummaryState createState() => _SupplierSummaryState();
}

class _SupplierSummaryState extends State<SupplierSummary> {

  List<dynamic> Report =  [];
  Future<List> getSupplierSummary() async{
    DateTime today = DateTime.now();
   SupplierSummaryReport().supplierreport(today).then((value){
      List<dynamic>list = (value as List).reversed.toList();
      setState(() {
        Report = list;
        //print("ggggggt$Report");
      });

    });
    return Report;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: FutureBuilder(
          future: getSupplierSummary(),
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
                    leading: ClipRRect(borderRadius:BorderRadius.circular(30),child: const Image(image: AssetImage("assets/suppliericon.png"))),
                    title: Text(element['supplierName'],style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                    subtitle: Wrap(children: <Widget>[
                      const Text("Mobile:",style: TextStyle(color: Colors.white60),),
                      Text(element['MobileNo'],style: const TextStyle(color: Colors.white60),)
                    ],
                    ),
                    trailing: Text(element['Amount'],style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),


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
