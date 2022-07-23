
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';

class CustomerSummary extends StatefulWidget {
  const CustomerSummary({Key? key}) : super(key: key);

  @override
  _CustomerSummaryState createState() => _CustomerSummaryState();
}

class _CustomerSummaryState extends State<CustomerSummary> {

  List<dynamic> Report =  [];
  Future<List> getCustomerSummary() async{
    DateTime today = DateTime.now();
    ClientSummary().clientreport(today).then((value){
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
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(70),
      //   child: AppBarNormal(
      //     mytitle: "Customer Summary",
      //   ),
      // ),
      body: FutureBuilder(
          future: getCustomerSummary(),
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
                    leading: ClipRRect(borderRadius:BorderRadius.circular(30),child: const Image(image: AssetImage("assets/customericon.jpg"),)),
                    title: Text(element['customerName'],style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
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
