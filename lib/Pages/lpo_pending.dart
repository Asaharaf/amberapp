import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LpoPendingReport extends StatefulWidget {
  const LpoPendingReport({Key? key}) : super(key: key);

  @override
  _LpoPendingReportState createState() => _LpoPendingReportState();
}

class _LpoPendingReportState extends State<LpoPendingReport> {

  List<dynamic> Report =  [];


  @override
  void initState() {
    DateTime today = DateTime.now();
    LpoPendingMaster().lpopending(today).then((value){
      List<dynamic> list = (value as List).reversed.toList();
      print(list);

      setState(() {
        Report = list;
      });

    });
    // super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Lpo Pending Report"),),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Report.length,
          itemBuilder: (context, index) {
            var element =  Report.elementAt(index);
            return Card(
              elevation: 10,
              color: Colors.blue,
              child: Container(
                color: Colors.white,
                height: 120,
                width: 150,
                padding: const EdgeInsets.symmetric(
                    vertical: 10),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: AutoSizeText(element['supplierName'],
                            maxLines: 1,
                            style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      // const Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(element['lpoDate'],style: const TextStyle(color: Colors.red,fontSize: 13,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('Lpo no:',style: TextStyle(color: Colors.black45),),
                      ),
                      Text(element['lpoNo'],style: const TextStyle(color: Colors.black45),),
                    //  Image(image: AssetImage("assets/purchaseIcon.png"),width: 30,height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(top: 40,left: 130),
                        child: Row(
                          children: [
                            const Text('QR.',style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.w300),),
                            Text(element['lpoAmount'],style: const TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
                          ],
                        ),

                      ),
                    ],
                  ),

                ],),

              ),
            );
          },
        ),
      ),
    );
  }
}
