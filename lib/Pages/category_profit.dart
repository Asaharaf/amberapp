import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryProfit extends StatefulWidget {
  const CategoryProfit({Key? key}) : super(key: key);

  @override
  _CategoryProfitState createState() => _CategoryProfitState();
}

class _CategoryProfitState extends State<CategoryProfit> {

  List<dynamic> Report =  [];
  Future<List> getCategoryProfit() async{
    DateTime today = DateTime.now();
    CategoryMaster().categoryprofit(today).then((value){
      List<dynamic>list = (value as List).reversed.toList();
//print(list);
      setState(() {
        Report = list;
      });

    });
    return Report;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Categoryprofit Report"),),
      body: FutureBuilder(
          future: getCategoryProfit(),
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

                    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(FontAwesomeIcons.bell,size: 50),
                            ),
                            Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(element['catName'].length > 17
                                    ? element['catName']
                                    .substring(0, 15) +
                                    '..'
                                    : element['catName'],overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.blue),),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text('sales : ${element['catAmount']}',style: const TextStyle(fontWeight: FontWeight.w500),),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                            children:<Widget>[

                              Text('cost : ${element['catCost']}'),
                              Chip(label: Text('profit : ${element['catProfit']}',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),))
                            ]),
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
