import 'package:amber_erp/Pages/HomeScreen.dart';
import 'package:amber_erp/Pages/cash_summary.dart';
import 'package:amber_erp/Pages/chequenotificationreceived.dart';
import 'package:amber_erp/Pages/profit_report.dart';
import 'package:amber_erp/Pages/purchase_report.dart';
import 'package:amber_erp/Pages/qtn_report.dart';
import 'package:amber_erp/Pages/sales_report.dart';
import 'package:amber_erp/Pages/salesorder_report.dart';
import 'package:amber_erp/Pages/tutorial_video.dart';
import 'package:amber_erp/Pages/wats_new_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     appBar: AppBar(title: const Text("Search Page"),
       actions: <Widget>[
         IconButton(icon: const Icon(Icons.search),onPressed: (){
           showSearch(context: context, delegate: DataSearch());
         },)
       ],
     ),
      drawer: const Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String>{
var sugItem;
  final pages =[
    "watsnew",
    "tutorials",
    "requirment",
    "dashbord",
    "salesreport",
    "cashsummary",
    "profitreport",
    "purchasereport",
    "quotationreport",
    "salesorderreport",
    "chequenotification"

  ];

  final recentPages=[
    "salesreport",
    "cashsummary",
    "profitreport",
    "purchasereport",
    "quotationreport",
    "salesorderreport",
    "chequenotification"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: const Icon(Icons.clear),onPressed: (){
      query="";
    })];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon:AnimatedIcon(icon:AnimatedIcons.menu_arrow,progress:transitionAnimation),onPressed: (){
      close(context, "");
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return InkWell(onTap: (){
      // print(sugItem);
      // print(query);
      if(sugItem =='watsnew')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WatsNewPage()));
      }
      if(sugItem =='tutorials')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TutorialVideo()));
      }
      if(sugItem =='requirment')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WatsNewPage()));
      }
      if(sugItem =='dashbord')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home_Screen()));
      }
      if(sugItem =='salesreport')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SalesReport()));
      }
      if(sugItem =='cashsummary')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CashSummary()));
      }
      if(sugItem =='profitreport')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfitReport()));
      }
      if(sugItem =='purchasereport')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PurchaseReport()));
      }
      if(sugItem =='quotationreport')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QuotationReport()));
      }
      if(sugItem =='salesorderreport')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SalesorderReport()));
      }
      if(sugItem =='chequenotification')
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChequeNotificationReceived()));
      }
    },);

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList=query.isEmpty?recentPages:pages.where((p) => p.startsWith(query)).toList();
    
    return ListView.builder(itemBuilder: (context,index)=>ListTile(
      onTap: (){
        showResults(context);
        sugItem=suggestionList[index];
      },
      leading: const Icon(Icons.location_city),
      title: RichText(text: TextSpan(
        text: suggestionList[index].substring(0,query.length),
        style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        children: [TextSpan(
          text: suggestionList[index].substring(query.length),
          style: const TextStyle(color: Colors.grey)
        )]
      ),),
    ),
      itemCount: suggestionList.length,
    );
  }
  
}