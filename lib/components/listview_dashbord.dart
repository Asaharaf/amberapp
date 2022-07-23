import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';

class MyListViewDashbord extends StatefulWidget {
   const MyListViewDashbord({Key? key}) : super(key: key);

  @override
  State<MyListViewDashbord> createState() => _MyListViewDashbordState();
}

class _MyListViewDashbordState extends State<MyListViewDashbord> {
  final List<String> TripList =[
    "Newyork","Boston","Payyoli","vatakara"
  ];
  List<dynamic> Report =  [];

  @override
  void initState() {
    var now = DateTime.now();
    DashWeekList().weekreport(now).then((value){
      //print("dashweek : $value");
      //var data = value;
      List<dynamic> list = (value as List).reversed.toList();


      setState(() {
        Report = list;
      });
    });
 //print(Report);
  }


  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,

      child: ListView.builder(
          itemCount: Report.length,
          itemBuilder: (context, index) => buildReportListCard(context, index)

      ),

    );
  }

    Widget buildReportListCard(context, index) {
        var element =  Report.elementAt(index);
      return Container(color: Colors.white,
          child: Card(elevation: 5, color: Colors.white,

        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(tileColor:Colors.blue,
            title:
              Text(element['date'], style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18)),
        trailing: CircleAvatar(child: Text(element['customercount'], style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.w900),),
          radius: 35,),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10.0),
              child: Row(
                children: [
                  const Text("Sales Return",
                    style: TextStyle(color:Colors.black,fontSize: 16, fontWeight: FontWeight.w600),),
                  const Spacer(),
                  Text(element['returnamount'], style: const TextStyle(color: Colors.red,fontSize: 16, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  const Text("Cash Sale", style: TextStyle(color:Colors.black,
                      fontSize: 16, fontWeight: FontWeight.w600),),
                  const Spacer(),
                  Text(element['cashamount'], style: const TextStyle(color: Colors.green,
                      fontSize: 16, fontWeight: FontWeight.w600),),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  const Text("Card Sale",
                    style: TextStyle(color:Colors.black,fontSize: 16, fontWeight: FontWeight.w600),),
                  const Spacer(),
                  Text(element['cardamount'],
                    style: const TextStyle(color: Colors.green,fontSize: 16, fontWeight: FontWeight.w600),),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 10),
              child: Row(
                children: const [
                  Text("Credit Sale", style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),),
                  Spacer(),
                  Text('0.00', style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170.0,bottom: 30),
              child: Text(element['saleamount'], style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),),
            ),


          ],
        ),
      ));
    }
}

